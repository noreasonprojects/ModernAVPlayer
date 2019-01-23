// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// ModernAVPlayerConfiguration.swift
// Created by raphael ankierman on 24/12/2018.
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

///
/// Documentation provided in PlayerConfiguration.swift
///

public struct ModernAVPlayerConfiguration: PlayerConfiguration {

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

    public var useDefaultRemoteCommand = true
    
    public let allowsExternalPlayback = false

    public init() {
        periodicPlayingTime = CMTime(seconds: 1, preferredTimescale: preferedTimeScale)
    }
}
