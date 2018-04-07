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
    let context: PlayerContext
    let remote: MPRemoteCommandCenter
    
    public init(context: PlayerContext, remote: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()) {
        self.context = context
        self.remote = remote
        defaultSetup()
    }
    
    private func defaultSetup() {
        remote.playCommand.isEnabled = true
        remote.pauseCommand.isEnabled = true
        remote.togglePlayPauseCommand.isEnabled = true
        remote.changePlaybackPositionCommand.isEnabled = true

        remote.stopCommand.isEnabled = false
        remote.previousTrackCommand.isEnabled = false
        remote.nextTrackCommand.isEnabled = false

        remote.playCommand.addTarget { [context] _ -> MPRemoteCommandHandlerStatus in
            print("∫∫∫ Remote command: play")
            context.play()
            return .success
        }
        
        remote.pauseCommand.addTarget { [context] _ -> MPRemoteCommandHandlerStatus in
            print("∫∫∫ Remote command: pause")
            context.pause()
            return .success
        }

        remote.changePlaybackPositionCommand.addTarget { event -> MPRemoteCommandHandlerStatus in
            guard let e = event as? MPChangePlaybackPositionCommandEvent
                else { return .commandFailed }

            let position = e.positionTime
            print("∫∫∫ Remote command: seek to \(position)")
            self.context.seek(position: position)
            return .success
        }
    }
}
