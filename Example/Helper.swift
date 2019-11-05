//
//  ReasonDesciption.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 18/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import ModernAVPlayer

struct Helper {

    func reasonDescription(_ reason: PlayerUnavailableActionReason) -> String {
        switch reason {
        case .alreadyPaused:
            return "Already Paused"
        case .alreadyPlaying:
            return "Already Playing"
        case .alreadyStopped:
            return "Already Stopped"
        case .alreadyTryingToPlay:
            return "Wait a moment, already trying to play"
        case .loadMediaFirst:
            return "Load a media first"
        case .waitEstablishedNetwork:
            return "Wait network to be established before"
        case .waitLoadedMedia:
            return "Wait media to be loaded before"
        case .seekPositionNotAvailable:
            return "Seek position not available"
        case .seekOverstepPosition:
            return "You can't seek after item end"
        }
    }
}
