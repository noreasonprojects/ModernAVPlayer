// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ContextConfiguration.swift
// Created by raphael ankierman on 12/03/2018.
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

public protocol PlayerConfiguration {

    /// Rate Observing Service
    /// When buffering, a timer is set to observe current item rate:
    ///
    var rateObservingTimeout: TimeInterval { get }
    var rateObservingTickTime: TimeInterval { get }

    /// General Audio preferences
    /// all CMTime created use the specific preferedTimeScale
    /// currentTime and control center elapsed playback time attributes are set in the periodic block.
    ///
    var preferedTimeScale: CMTimeScale { get }
    var periodicPlayingTime: CMTime { get }
    var audioSessionCategory: String { get }

    /// Reachability Service
    /// When buffering or playing and playback stop unexpectedly, a timer is set to check connectivity via URLSession
    ///
    var reachabilityURLSessionTimeout: TimeInterval { get }
    var reachabilityNetworkTestingURL: URL { get }
    var reachabilityNetworkTestingTickTime: TimeInterval { get }
    var reachabilityNetworkTestingIteration: UInt { get }
    
    /// Remote Command Center
    ///
    var useDefaultRemoteCommandCenter: Bool { get }
}

public struct ModernAVPlayerConfiguration: PlayerConfiguration {
    
    // Buffering State
    public let rateObservingTimeout: TimeInterval = 3
    public let rateObservingTickTime: TimeInterval = 0.3

    // General Audio preferences
    public let preferedTimeScale: CMTimeScale = 1
    public let periodicPlayingTime: CMTime
    public let audioSessionCategory = AVAudioSessionCategoryPlayback

    // Reachability Service
    public let reachabilityURLSessionTimeout: TimeInterval = 3
    //swiftlint:disable:next force_unwrapping
    public let reachabilityNetworkTestingURL = URL(string: "https://www.google.com")!
    public let reachabilityNetworkTestingTickTime: TimeInterval = 3
    public let reachabilityNetworkTestingIteration: UInt = 10

    public var useDefaultRemoteCommandCenter = true
    
    public init() {
        periodicPlayingTime = CMTime(seconds: 1, preferredTimescale: preferedTimeScale)
    }
}
