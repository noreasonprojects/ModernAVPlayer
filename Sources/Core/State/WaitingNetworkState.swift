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
    
    unowned let context: PlayerContext
    private var reachability: ReachabilityService
    
    // MARK: - Variable
    
    let type: ModernAVPlayer.State = .waitingForNetwork
    
    // MARK: - Init
    
    init(context: PlayerContext,
         autostart: Bool,
         error: PlayerError,
         reachabilityService: ReachabilityService? = nil) {
        
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleState)
        self.context = context
        self.reachability = reachabilityService ?? ModernAVPlayerReachabilityService(config: context.config)
        setupReachabilityCallbacks(autostart: autostart, error: error)
    }
    
    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleState)
    }
    
    func contextUpdated() {
        reachability.start()
        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }
        context.plugins.forEach { $0.didStartWaitingForNetwork(media: media) }

        guard let mediaItem = media as? PlayerMediaItem
            else { return }
        context.failedUsedAVPlayerItem.insert(mediaItem.item)
    }
    
    // MARK: - Reachability
    
    private func setupReachabilityCallbacks(autostart: Bool, error: PlayerError) {
        reachability.isTimedOut = { [weak self] in
            guard let strongSelf = self else { return }
            
            let failedState = FailedState(context: strongSelf.context, error: error)
            self?.context.changeState(state: failedState)
        }
        
        reachability.isReachable = { [weak self] in
            guard let media = self?.context.currentMedia else { assertionFailure(); return }
            guard let strongSelf = self else { return }

            let currentTime = strongSelf.context.player.currentTime()
            let lastKnownPosition = strongSelf.isDurationItemFinite() ? currentTime : nil
            let state = LoadingMediaState(context: strongSelf.context,
                                          media: media,
                                          autostart: autostart,
                                          position: lastKnownPosition?.seconds)
            strongSelf.context.changeState(state: state)
        }
    }
    
    private func isDurationItemFinite() -> Bool {
        return context.itemDuration?.isFinite ?? false
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
        let debug = "Reload a media first before playing"
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
        context.delegate?.playerContext(unavailableActionReason: .waitEstablishedNetwork)
    }
    
    func seek(position: Double) {
        let debug = "Reload a media first before seeking"
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
        context.delegate?.playerContext(unavailableActionReason: .waitEstablishedNetwork)
    }
    
    func seek(position: Double, toleranceBefore: CMTime, toleranceAfter: CMTime) {
        let debug = "Reload a media first before seeking"
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
        context.delegate?.playerContext(unavailableActionReason: .waitEstablishedNetwork)
    }
    
    func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
