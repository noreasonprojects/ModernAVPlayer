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

    unowned var context: PlayerContext
    
    // MARK: - Variable
    
    var type: ModernAVPlayer.State = .failed
    
    // MARK: - Init
    
    init(context: PlayerContext, error: PlayerError) {
        LoggerInHouse.instance.log(message: "Entering failed state (\(error.localizedDescription))", event: .info)
        self.context = context
        
        context.plugins.forEach { $0.didFailed() }
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }

    // MARK: - Shared actions

    func loadCurrentMedia(media: PlayerMedia, autostart: Bool) {
        let state = LoadingMediaState(context: context, media: media, autostart: autostart)
        context.changeState(state: state)
    }

    func pause() {
        sendDebugMessage("Unable to pause, load a media first")
    }

    func play() {
        sendDebugMessage("Unable to play, load a media first")
    }

    func seek(position: Double) {
        sendDebugMessage("Unable to seek, load a media first")
    }

    func stop() {
        sendDebugMessage("Unable to stop, load a media first")
    }
    
    private func sendDebugMessage(_ debugMessage: String) {
        context.debugMessage = debugMessage
        LoggerInHouse.instance.log(message: debugMessage, event: .warning)
    }
}
