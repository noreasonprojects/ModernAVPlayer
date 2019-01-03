// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PausedState.swift
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

final class PausedState: PlayerState {
    
    // MARK: - Input
    
    unowned var context: PlayerContext
    private var interruptionAudioService: ModernAVPlayerInterruptionAudioService

    // MARK: - Output
    
    var onInterruptionEnded: (() -> Void)? {
        didSet { interruptionAudioService.onInterruptionEnded = onInterruptionEnded }
    }
    
    // MARK: - Variable
    
    var type: ModernAVPlayer.State

    // MARK: Init
    
    init(context: PlayerContext,
         position: Double? = nil,
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService()) {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleState)
        self.context = context
        self.interruptionAudioService = interruptionAudioService
        type = position == 0 ? .stopped : .paused
        self.context.player.pause()

        guard let position = position else { return }
        seek(position: position)
    }
    
    func contextUpdated() {
        context.plugins.forEach {
            if type == .paused {
                $0.didPaused(media: context.currentMedia, position: context.currentTime)
            } else if type == .stopped {
                $0.didStopped(media: context.currentMedia, position: context.currentTime)
            } else {
                assertionFailure()
            }
        }
    }
    
    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleState)
    }
    
    // MARK: - Shared actions
    
    func load(media: PlayerMedia, autostart: Bool, position: Double? = nil) {
        let state = LoadingMediaState(context: context, media: media, autostart: autostart, position: position)
        context.changeState(state: state)
    }

    func pause() {
        guard type == .paused
            else { context.changeState(state: PausedState(context: context)); return }
        let debug = "Already paused"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }

    func play() {
        if context.currentItem?.status == .readyToPlay {
            let state = BufferingState(context: context)
            context.changeState(state: state)
            state.playCommand()
        } else if let media = context.currentMedia {
            let state = LoadingMediaState(context: context, media: media, autostart: true)
            context.changeState(state: state)
        } else {
            let debug = "Please load item before playing"
            context.debugMessage = debug
            ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
        }
    }

    func seek(position: Double) {
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { [context] completed in
            guard completed else { return }
            context.delegate?.playerContext(didCurrentTimeChange: context.currentTime)
            context.nowPlaying.overrideInfoCenter(for: MPNowPlayingInfoPropertyElapsedPlaybackTime,
                                                  value: NSNumber(value: context.currentTime))
        }
    }

    func stop() {
        guard type == .stopped
            else { context.changeState(state: PausedState(context: context, position: 0)); return }
        let debug = "Already stopped"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }
}
