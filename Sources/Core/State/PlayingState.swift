// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayingState.swift
// Created by raphael ankierman on 23/02/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import AVFoundation
import MediaPlayer

final class PlayingState: PlayerState {
    
    // MARK: - Inputs
    
    unowned let context: PlayerContext
    private var itemPlaybackObservingService: PlaybackObservingService
    private let routeAudioService: ModernAVPlayerRouteAudioService
    private let interruptionAudioService: ModernAVPlayerInterruptionAudioService
    private let audioSession: AVAudioSession
    
    // MARK: - Variables
    
    let type: ModernAVPlayer.State = .playing
    private var timerObserver: Any?
    
    // MARK: - Lifecycle

    init(context: PlayerContext,
         itemPlaybackObservingService: PlaybackObservingService,
         routeAudioService: ModernAVPlayerRouteAudioService = ModernAVPlayerRouteAudioService(),
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService(),
         audioSession: AVAudioSession = AVAudioSession.sharedInstance()) {
        
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleState)
        self.context = context
        self.itemPlaybackObservingService = itemPlaybackObservingService
        self.routeAudioService = routeAudioService
        self.interruptionAudioService = interruptionAudioService
        self.audioSession = audioSession
        stopBgTask(context: context)
        setTimerObserver()
        
        self.routeAudioService.onRouteChanged = { [weak self] in self?.routeAudioChanged(reason: $0) }
        setupPlaybackObservingCallback()
        setupInterruptionCallback()
    }
    
    func contextUpdated() {
        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }
        context.plugins.forEach { $0.didStartPlaying(media: media) }
    }
    
    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleState)
        if let to = timerObserver { context.player.removeTimeObserver(to) }
    }

    // MARK: - Background task

    private func startBgTask(context: PlayerContext) {
        context.bgToken = UIApplication.shared.beginBackgroundTask { [context] in
            if let token = context.bgToken {
                UIApplication.shared.endBackgroundTask(token)
            }
            context.bgToken = nil
        }
        ModernAVPlayerLogger.instance.log(message: "StartBgTask create: \(String(describing: context.bgToken))", domain: .service)
    }

    private func stopBgTask(context: PlayerContext) {
        guard let token = context.bgToken else { return }

        ModernAVPlayerLogger.instance.log(message: "StopBgTask: \(token)", domain: .service)
        UIApplication.shared.endBackgroundTask(token)
        context.bgToken = nil
    }

    // MARK: - Shared actions

    func load(media: PlayerMedia, autostart: Bool, position: Double? = nil) {
        let state = LoadingMediaState(context: context, media: media, autostart: autostart, position: position)
        context.changeState(state: state)
    }

    func pause() {
        context.changeState(state: PausedState(context: context))
    }
    
    func play() {
        let debug = "Already playing"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }

    func seek(position: Double) {
        let state = BufferingState(context: context)
        context.changeState(state: state)
        state.seekCommand(position: position)
    }

    func stop() {
        context.changeState(state: StoppedState(context: context))
    }

    // MARK: - Playback Observing Service
    
    private func setupPlaybackObservingCallback() {
        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }

        itemPlaybackObservingService.onPlaybackStalled = { [weak self] in self?.redirectToWaitingForNetworkState() }
        itemPlaybackObservingService.onFailedToPlayToEndTime = { [weak self] in self?.redirectToWaitingForNetworkState() }
        itemPlaybackObservingService.onPlayToEndTime = { [weak self, context] in
            context.delegate?.playerContext(didItemPlayToEndTime: context.currentTime)
            context.plugins.forEach { $0.didItemPlayToEndTime(media: media, endTime: context.currentTime) }
            if context.loopMode {
                self?.seek(position: 0)
            } else {
                self?.redirectToStoppedState()
            }
        }
    }
    
    private func redirectToWaitingForNetworkState() {
        guard let url = (context.currentItem?.asset as? AVURLAsset)?.url
            else { assertionFailure(); return }
        
        startBgTask(context: context)
        context.changeState(state: WaitingNetworkState(context: context,
                                                       urlToReload: url,
                                                       autostart: true,
                                                       error: .playbackStalled))
    }

    private func redirectToStoppedState() {
        context.changeState(state: StoppedState(context: context))
    }
    
    // MARK: - Interruption Service
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pauseByInterruption() }
    }
    
    /*
     Do not set any call back on interruption ended when user play from another app
    */
    private func pauseByInterruption() {
        let state = PausedState(context: context)
        if !audioSession.secondaryAudioShouldBeSilencedHint {
            state.onInterruptionEnded = { [weak state] in state?.play() }
        }
        context.changeState(state: state)
    }
    
    // MARK: - Private actions

    private func setTimerObserver() {
        timerObserver = context.player.addPeriodicTimeObserver(forInterval: context.config.periodicPlayingTime,
                                                               queue: nil) { [context] time in
            context.delegate?.playerContext(didCurrentTimeChange: time.seconds)
            context.nowPlaying.overrideInfoCenter(for: MPNowPlayingInfoPropertyElapsedPlaybackTime,
                                                  value: time.seconds)
        }
    }
    
    private func routeAudioChanged(reason: AVAudioSession.RouteChangeReason) {
        switch reason {
        case .oldDeviceUnavailable, .unknown:
            context.changeState(state: PausedState(context: context))
        default:
            break
        }
    }
}
