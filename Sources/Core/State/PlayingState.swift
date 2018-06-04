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
    
    // MARK: - Input
    
    unowned let context: PlayerContext
    private var itemPlaybackObservingService: PlaybackObservingService
    private let routeAudioService: ModernAVPlayerRouteAudioService
    private let interruptionAudioService: ModernAVPlayerInterruptionAudioService
    
    // MARK: - Variables
    
    var type: ModernAVPlayer.State = .playing
    private var timerObserver: Any?
    
    // MARK: - Lifecycle

    init(context: PlayerContext,
         itemPlaybackObservingService: PlaybackObservingService = ModernAVPlayerPlaybackObservingService(),
         routeAudioService: ModernAVPlayerRouteAudioService = ModernAVPlayerRouteAudioService(),
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService()) {
        
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.itemPlaybackObservingService = itemPlaybackObservingService
        self.routeAudioService = routeAudioService
        self.interruptionAudioService = interruptionAudioService
        stopBgTask(context: context)
        setTimerObserver()
        
        self.itemPlaybackObservingService.onPlaybackStalled = { [weak self] in self?.playbackStalled() }
        self.itemPlaybackObservingService.onPlayToEndTime = { [weak self] in self?.playToEndTime() }
        self.routeAudioService.onRouteChanged = { [weak self] in self?.routeAudioChanged(reason: $0) }
        setupInterruptionCallback()
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
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
        LoggerInHouse.instance.log(message: "StartBgTask create: \(String(describing: context.bgToken))", event: .info)
    }

    private func stopBgTask(context: PlayerContext) {
        guard let token = context.bgToken else { return }

        LoggerInHouse.instance.log(message: "StopBgTask: \(token)", event: .info)
        UIApplication.shared.endBackgroundTask(token)
        context.bgToken = nil
    }

    // MARK: - Shared actions

    func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        context.changeState(state: state)
    }

    func pause() {
        context.changeState(state: PausedState(context: context))
    }
    
    private func pauseByInterruption() {
        let state = PausedState(context: context)
        state.onInterruptionEnded = { [weak state] in
            state?.play()
        }
        context.changeState(state: state)
    }

    func play() {
        let debug = "Already playing"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }

    func seek(position: Double) {
        let state = BufferingState(context: context)
        context.changeState(state: state)
        state.seekCommand(position: position)
    }

    func stop() {
        context.changeState(state: StoppedState(context: context))
    }

    // MARK: - Private actions

    private func setTimerObserver() {
        timerObserver = context.player.addPeriodicTimeObserver(forInterval: context.config.periodicPlayingTime,
                                                               queue: nil) { [context] time in
            context.currentTime = time.seconds
            context.nowPlaying.overrideInfoCenter(for: MPNowPlayingInfoPropertyElapsedPlaybackTime,
                                                  value: time.seconds)
        }
    }
    
    private func playbackStalled() {
        guard let url = (context.player.currentItem?.asset as? AVURLAsset)?.url
            else { assertionFailure(); return }

        startBgTask(context: context)
        context.changeState(state: WaitingNetworkState(context: context,
                                                       urlToReload: url,
                                                       shouldPlaying: true,
                                                       error: .itemPlaybackStalled))
    }
    
    private func playToEndTime() {
        guard let duration = context.itemDuration
            else { assertionFailure(); return }
        
        let roundedCurrentTime = context.player.currentTime().seconds.rounded(.up)
        guard roundedCurrentTime >= duration
            else { self.playbackStalled(); return }
        context.changeState(state: StoppedState(context: context))
    }
    
    private func routeAudioChanged(reason: AVAudioSessionRouteChangeReason) {
        switch reason {
        case .oldDeviceUnavailable, .unknown:
            context.changeState(state: PausedState(context: context))
        case .newDeviceAvailable, .wakeFromSleep, .override, .noSuitableRouteForCategory, .routeConfigurationChange, .categoryChange:
            break
        }
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pauseByInterruption() }
    }
}
