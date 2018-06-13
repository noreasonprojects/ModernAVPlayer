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

public protocol CommandCenter {
    var remote: MPRemoteCommandCenter { get }
    
    init(remote: MPRemoteCommandCenter)
    func configure(player: MediaPlayer)
}

public struct ModernAVPlayerCommandCenter: CommandCenter {
    public let remote: MPRemoteCommandCenter
    
    public init(remote: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()) {
        self.remote = remote
    }
    
    public func configure(player: MediaPlayer) {
        enableCommands()
        playCommand(player: player)
        pauseCommand(player: player)
        
        if #available(iOS 9.1, *) {
            changePlaybackPositionCommand(player: player)
        }
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
    
    private func playCommand(player: MediaPlayer) {
        remote.playCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            LoggerInHouse.instance.log(message: "Remote command: play", event: .info)
            player.play()
            return .success
        }
    }
    
    private func pauseCommand(player: MediaPlayer) {
        remote.pauseCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            LoggerInHouse.instance.log(message: "Remote command: pause", event: .info)
            player.pause()
            return .success
        }
    }
    
    @available(iOS 9.1, *)
    private func changePlaybackPositionCommand(player: MediaPlayer) {
        remote.changePlaybackPositionCommand.addTarget { [player] event -> MPRemoteCommandHandlerStatus in
            guard let e = event as? MPChangePlaybackPositionCommandEvent
                else { return .commandFailed }
            
            let position = e.positionTime
            LoggerInHouse.instance.log(message: "Remote command: seek to \(position)", event: .info)
            player.seek(position: position)
            return .success
        }
    }
}
