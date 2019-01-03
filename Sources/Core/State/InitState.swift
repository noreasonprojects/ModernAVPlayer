// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// InitState.swift
// Created by raphael ankierman on 28/02/2018.
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

struct InitState: PlayerState {

    // MARK: - Input

    unowned let context: PlayerContext
    
    // MARK: - Variable
    
    let type: ModernAVPlayer.State = .initialization
    
    // MARK: - Init

    init(context: PlayerContext) {
        ModernAVPlayerLogger.instance.log(message: "Init (struct)", domain: .lifecycleState)
        self.context = context
        context.player.automaticallyWaitsToMinimizeStalling = false
    }
    
    func contextUpdated() { }
    
    // MARK: - Shared actions

    func load(media: PlayerMedia, autostart: Bool, position: Double? = nil) {
        let state = LoadingMediaState(context: context, media: media, autostart: autostart, position: position)
        context.changeState(state: state)
    }
    
    func pause() {
        context.changeState(state: PausedState(context: context))
    }
    
    func play() {
        let debug = "Load item before playing"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }
    
    func seek(position: Double) {
        let debug = "Unable to seek, load a media first"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }
    
    func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
