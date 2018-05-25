//
//  ModernAVPlayerState.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 25/05/2018.
//

import Foundation

public enum ModernAVPlayerState: String {
    case buffering
    case failed
    case initialization
    case loaded
    case loading
    case paused
    case playing
    case stopped
    case waitingNetwork
}

public extension ModernAVPlayerState {
    var description: String { return rawValue.capitalized }
}
