//
//  CommandCenter.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 14/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
import MediaPlayer

public struct SetupCommandCenter {
    let player: ModernAVPlayer
    let remote: MPRemoteCommandCenter
    
    public init(player: ModernAVPlayer, remote: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()) {
        self.player = player
        self.remote = remote
        defaultSetup()
    }
    
    private func defaultSetup() {
        remote.playCommand.isEnabled = true
        remote.pauseCommand.isEnabled = true
        remote.togglePlayPauseCommand.isEnabled = true
        if #available(iOS 9.1, *) {
            remote.changePlaybackPositionCommand.isEnabled = true
        }

        remote.stopCommand.isEnabled = false
        remote.previousTrackCommand.isEnabled = false
        remote.nextTrackCommand.isEnabled = false

        remote.playCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            LoggerInHouse.instance.log(message: "Remote command: play", event: .info)
            player.play()
            return .success
        }
        
        remote.pauseCommand.addTarget { [player] _ -> MPRemoteCommandHandlerStatus in
            LoggerInHouse.instance.log(message: "Remote command: pause", event: .info)
            player.pause()
            return .success
        }

        if #available(iOS 9.1, *) {
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
}
