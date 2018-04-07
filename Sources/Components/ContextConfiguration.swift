//
//  PlayerContextConfiguration.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 12/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public protocol ContextConfiguration {

    // Buffering State
    var timeoutBuffering: TimeInterval { get }
    var playerRateObserving: TimeInterval { get }

    // General Audio preferences
    var preferedTimeScale: CMTimeScale { get }
    var periodicPlayingTime: CMTime { get }
    var audioSessionCategory: String { get }

    // Reachability Service
    var timeoutURLSession: TimeInterval { get }
    var urlNetworkTesting: URL { get }
    var tiNetworkTesting: TimeInterval { get }
    var networkIteration: UInt { get }
}

public struct PlayerContextConfiguration: ContextConfiguration {

    // Buffering State
    public let timeoutBuffering: TimeInterval = 3
    public let playerRateObserving: TimeInterval = 0.3

    // General Audio preferences
    public let preferedTimeScale: CMTimeScale = 1
    public let periodicPlayingTime: CMTime
    public let audioSessionCategory = AVAudioSessionCategoryPlayback

    // Reachability Service
    public let timeoutURLSession: TimeInterval = 3
    //swiftlint:disable:next force_unwrapping
    public let urlNetworkTesting = URL(string: "https://www.google.com")!
    public let tiNetworkTesting: TimeInterval = 3
    public let networkIteration: UInt = 10

    public init() {
        periodicPlayingTime = CMTime(seconds: 1, preferredTimescale: preferedTimeScale)
    }
}
