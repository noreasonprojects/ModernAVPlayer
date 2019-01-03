// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// FailedState.swift
// Created by raphael ankierman on 24/02/2018.
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

final class FailedState: PlayerState {

    // MARK: - Input

    unowned let context: PlayerContext
    private let error: PlayerError
    
    // MARK: - Variable
    
    let type: ModernAVPlayer.State = .failed
    
    // MARK: - Init
    
    init(context: PlayerContext, error: PlayerError) {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleState)
        self.context = context
        self.error = error
    }
    
    func contextUpdated() {
        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }
        context.plugins.forEach { $0.didFailed(media: media, error: error) }
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
        sendDebugMessage("Unable to pause, load a media first")
    }

    func play() {
        guard let media = context.currentMedia
            else { assertionFailure("should not possible to be in failed state without load any media"); return }
        
        let state = LoadingMediaState(context: context, media: media, autostart: true)
        context.changeState(state: state)
    }

    func seek(position: Double) {
        sendDebugMessage("Unable to seek, load a media first")
    }

    func stop() {
        sendDebugMessage("Unable to stop, load a media first")
    }
    
    private func sendDebugMessage(_ debugMessage: String) {
        context.debugMessage = debugMessage
        ModernAVPlayerLogger.instance.log(message: debugMessage, domain: .unavailableCommand)
    }
}
