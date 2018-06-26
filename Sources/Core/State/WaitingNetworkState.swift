// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// WaitingNetworkState.swift
// Created by raphael ankierman on 18/05/2018.
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

final class WaitingNetworkState: PlayerState {
    
    // MARK: - Inputs
    
    unowned var context: PlayerContext
    private var reachability: ReachabilityService
    
    // MARK: - Variable
    
    var type: ModernAVPlayer.State = .waitingForNetwork
    
    // MARK: - Init
    
    init(context: PlayerContext,
         urlToReload: URL,
         autostart: Bool,
         error: PlayerError,
         reachabilityService: ReachabilityService? = nil) {
        LoggerInHouse.instance.log(message: "Entering waiting for network state", event: .info)
        self.context = context
        self.reachability = reachabilityService ?? ModernAVPlayerReachabilityService(config: context.config)
        setupReachabilityCallbacks(autostart: autostart, urlToReload: urlToReload, error: error)
        reachability.start()
        
        context.plugins.forEach { $0.didStartWaitingForNetwork() }
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    // MARK: - Reachability
    
    private func setupReachabilityCallbacks(autostart: Bool, urlToReload: URL, error: PlayerError) {
        reachability.isTimedOut = { [weak self] in
            guard let strongSelf = self else { return }
            
            let failedState = FailedState(context: strongSelf.context, error: error)
            self?.context.changeState(state: failedState)
        }
        
        reachability.isReachable = { [weak self] in
            guard let strongSelf = self else { return }
            
            let lastKnownPosition = strongSelf.isDurationItemFinite() ? strongSelf.context.player.currentTime() : nil
            let state = LoadingMediaState(context: strongSelf.context,
                                          autostart: autostart,
                                          lastPosition: lastKnownPosition)
            strongSelf.context.changeState(state: state)
        }
    }
    
    private func isDurationItemFinite() -> Bool {
        return context.itemDuration?.isFinite ?? false
    }
    
    // MARK: - Shared actions
    
    func loadCurrentMedia(autostart: Bool) {
        let state = LoadingMediaState(context: context, autostart: autostart)
        context.changeState(state: state)
    }
    
    func pause() {
        context.changeState(state: PausedState(context: context))
    }
    
    func play() {
        let debug = "Unable to play, reload a media first"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: "Unable to play, reload a media first", event: .warning)
    }
    
    func seek(position: Double) {
        let debug = "Unable to seek, load a media first"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: "Unable to seek, load a media first", event: .warning)
    }
    
    func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
