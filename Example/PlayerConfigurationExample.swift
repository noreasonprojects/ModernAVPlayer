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

struct PlayerConfigurationExample: PlayerConfiguration {

    // Buffering State
    let rateObservingTimeout: TimeInterval = 3
    let rateObservingTickTime: TimeInterval = 0.3

    // General Audio preferences
    let preferredTimescale = CMTimeScale(NSEC_PER_SEC)
    let periodicPlayingTime: CMTime
    let audioSessionCategory = AVAudioSession.Category.playback
    let audioSessionCategoryOptions: AVAudioSession.CategoryOptions? = nil

    // Reachability Service
    let reachabilityURLSessionTimeout: TimeInterval = 3
    //swiftlint:disable:next force_unwrapping
    let reachabilityNetworkTestingURL = URL(string: "https://www.google.com")!
    let reachabilityNetworkTestingTickTime: TimeInterval = 3
    let reachabilityNetworkTestingIteration: UInt = 10

    // RemoteCommandExample is used for example
    var useDefaultRemoteCommand = false
    
    let allowsExternalPlayback = false

    // AVPlayerItem Init Service
    let itemLoadedAssetKeys = ["playable", "duration"]

    init() {
        periodicPlayingTime = CMTime(seconds: 0.1, preferredTimescale: preferredTimescale)
    }
}
