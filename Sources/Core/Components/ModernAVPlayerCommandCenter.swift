// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// SetupCommandCenter.swift
// Created by raphael ankierman on 14/03/2018.
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

import Foundation
import MediaPlayer

struct ModernAVPlayerRemoteCommandCenter {
    
    // MARK: Input
    
    private let remote: MPRemoteCommandCenter
    private let player: ModernAVPlayerExposable
    
    // MARK: Init
    
    @discardableResult
    init(player: ModernAVPlayerExposable, remote: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()) {
        ModernAVPlayerLogger.instance.log(message: "Init (struct)", domain: .lifecycleService)
        self.remote = remote
        self.player = player
        configure()
    }
    
    private func configure() {
        enableCommands()
        setPlayCommandCallback()
        setPauseCommandCallback()
        setTogglePlayPauseCommandCallback()
        
        guard #available(iOS 9.1, *) else { return }
        setChangePlaybackPositionCommandCallback()
    }
    
    private func enableCommands() {
        remote.playCommand.isEnabled = true
        remote.pauseCommand.isEnabled = true
        remote.togglePlayPauseCommand.isEnabled = true

        remote.stopCommand.isEnabled = false
        remote.previousTrackCommand.isEnabled = false
        remote.nextTrackCommand.isEnabled = false
        
        if #available(iOS 9.1, *) {
            remote.changePlaybackPositionCommand.isEnabled = true
        }
    }
    
    private func setPlayCommandCallback() {
        remote.playCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            ModernAVPlayerLogger.instance.log(message: "Remote command: play", domain: .service)
            player.play()
            return .success
        }
    }
    
    private func setPauseCommandCallback() {
        remote.pauseCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            ModernAVPlayerLogger.instance.log(message: "Remote command: pause", domain: .service)
            player.pause()
            return .success
        }
    }
    
    private func setTogglePlayPauseCommandCallback() {
        remote.togglePlayPauseCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            ModernAVPlayerLogger.instance.log(message: "Remote command: toggle play pause", domain: .service)
            guard let isResting = self.isPlayerResting() else { return .noSuchContent }
            isResting ? player.play() : player.pause()
            return .success
        }
    }
    
    private func isPlayerResting() -> Bool? {
        switch player.state {
        case .buffering, .loading, .playing, .waitingForNetwork:
            return false
        case .failed, .loaded, .paused, .stopped:
            return true
        case .initialization:
            return nil
        }
    }
    
    @available(iOS 9.1, *)
    private func setChangePlaybackPositionCommandCallback() {
        remote.changePlaybackPositionCommand.addTarget { [player] event -> MPRemoteCommandHandlerStatus in
            guard let e = event as? MPChangePlaybackPositionCommandEvent
                else { return .commandFailed }
            
            let position = e.positionTime
            ModernAVPlayerLogger.instance.log(message: "Remote command: seek to \(position)", domain: .service)
            player.seek(position: position)
            return .success
        }
    }
}
