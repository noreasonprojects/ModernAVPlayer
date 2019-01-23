//
//  PlayerConfigurationExample.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 18/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
import ModernAVPlayer

///
/// Documentation provided in PlayerConfiguration.swift
///

public struct PlayerConfigurationExample: PlayerConfiguration {

    // Buffering State
    public let rateObservingTimeout: TimeInterval = 3
    public let rateObservingTickTime: TimeInterval = 0.3

    // General Audio preferences
    public let preferedTimeScale: CMTimeScale = 1
    public let periodicPlayingTime: CMTime
    public let audioSessionCategory = AVAudioSession.Category.playback

    // Reachability Service
    public let reachabilityURLSessionTimeout: TimeInterval = 3
    //swiftlint:disable:next force_unwrapping
    public let reachabilityNetworkTestingURL = URL(string: "https://www.google.com")!
    public let reachabilityNetworkTestingTickTime: TimeInterval = 3
    public let reachabilityNetworkTestingIteration: UInt = 10

    // RemoteCommandExample is used for example
    public var useDefaultRemoteCommand = false
    
    public let allowsExternalPlayback = false

    public init() {
        periodicPlayingTime = CMTime(seconds: 1, preferredTimescale: preferedTimeScale)
    }
}
