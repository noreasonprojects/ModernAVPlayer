// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// BufferingState.swift
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

final class BufferingState: NSObject, PlayerState {
    
    // MARK: - Inputs
    
    unowned let context: PlayerContext
    private var rateObservingService: RateObservingService
    private var interruptionAudioService: ModernAVPlayerInterruptionAudioService
    private var playerCurrentTime: Double { return context.currentTime }
    
    // MARK: - Variable

    let type: ModernAVPlayer.State = .buffering

    // MARK: - Init

    init(context: PlayerContext,
         rateObservingService: RateObservingService? = nil,
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService()) {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleState)
        
        guard let item = context.currentItem else { fatalError("item should exist") }
        
        self.context = context
        self.rateObservingService = rateObservingService ?? ModernAVPlayerRateObservingService(config: context.config, item: item)
        self.interruptionAudioService = interruptionAudioService
        
        super.init()
        setupRateObservingCallback()
        setupInterruptionCallback()
    }
    
    func contextUpdated() {
        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }
        context.plugins.forEach { $0.didStartBuffering(media: media) }
        context.remoteCommands?.forEach {
            let isEnabled = $0.isEnabled(media.type)
            $0.reference.isEnabled = isEnabled
            ModernAVPlayerLogger.instance.log(message: "Set \($0) to \(isEnabled)", domain: .remoteCommand)
        }
    }
    
    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleState)
    }
    
    // MARK: - Setup
    
    private func setupRateObservingCallback() {
        rateObservingService.onTimeout = { [context] in
            guard let url = (context.currentItem?.asset as? AVURLAsset)?.url
                else { return }
            
            let waitingState = WaitingNetworkState(context: context,
                                                   urlToReload: url,
                                                   autostart: true,
                                                   error: .bufferingFailed)
            context.changeState(state: waitingState)
        }

        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }

        rateObservingService.onPlaying = { [context, playerCurrentTime] in
            context.plugins.forEach { $0.willStartPlaying(media: media, position: playerCurrentTime) }
            let playbackService = ModernAVPlayerPlaybackObservingService(player: context.player)
            context.changeState(state: PlayingState(context: context, itemPlaybackObservingService: playbackService))
        }
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pause() }
    }
    
    // MARK: - Player Commands

    func playCommand() {
        rateObservingService.start()
        context.player.play()
    }

    func seekCommand(position: Double) {
        context.currentItem?.cancelPendingSeeks()
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { [context] completed in
            guard completed else { return }
            context.delegate?.playerContext(didCurrentTimeChange: context.currentTime)
            self.playCommand()
        }
    }

    // MARK: - Shared actions

    func load(media: PlayerMedia, autostart: Bool, position: Double? = nil) {
        let state = LoadingMediaState(context: context, media: media, autostart: autostart, position: position)
        changeState(state)
    }

    func pause() {
        changeState(PausedState(context: context))
    }

    func play() {
        let debug = "Already trying to play"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: "Already trying to play", domain: .unavailableCommand)
    }

    func seek(position: Double) {
        seekCommand(position: position)
    }

    func stop() {
        changeState(StoppedState(context: context))
    }
    
    // MARK: - Private
    
    private func changeState(_ state: PlayerState) {
        rateObservingService.stop(clearCallbacks: true)
        context.currentItem?.cancelPendingSeeks()
        context.changeState(state: state)
    }
}
