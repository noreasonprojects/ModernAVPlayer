// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// MockCustomPlayer.swift
// Created by raphael ankierman on 28/02/2018.
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
import Foundation
import Quick
import Nimble

final class MockCustomPlayer: AVPlayer {

    init(overrideCurrentItem item: AVPlayerItem? = nil) {
        super.init()
        overrideCurrentItem = item
    }
    
    var overrideCurrentItem: AVPlayerItem?
    override var currentItem: AVPlayerItem? {
        return overrideCurrentItem
    }

    var overrideStatus = AVPlayer.Status.unknown
    override var status: AVPlayer.Status {
        return overrideStatus
    }
    
    var overrideCurrentTime: CMTime?
    override func currentTime() -> CMTime {
        return overrideCurrentTime ?? CMTime(seconds: 0, preferredTimescale: 1)
    }
    
    var pauseCallCount = 0
    override func pause() {
        pauseCallCount += 1
    }
    
    var playCallCount = 0
    override func play() {
        playCallCount += 1
    }
    
    var seekCompletionCallCount = 0
    var seekCompletionLastParam: CMTime?
    var seekCompletionHandlerReturn: Bool?
    override func seek(to time: CMTime, completionHandler: @escaping (Bool) -> Void) {
        seekCompletionCallCount += 1
        seekCompletionLastParam = time

        guard let completion = seekCompletionHandlerReturn else { return }

        if completion {
            overrideCurrentTime = time
        }

        completionHandler(completion)
    }
    
    var replaceCurrentItemCallCount = 0
    var replaceCurrentItemCallCountLastParam: AVPlayerItem?
    override func replaceCurrentItem(with item: AVPlayerItem?) {
        replaceCurrentItemCallCount += 1
        replaceCurrentItemCallCountLastParam = item
    }

    var addObserverCallCount = 0
    var addObserverLastKeyPathParam: String?
    override func addObserver(_ observer: NSObject, forKeyPath keyPath: String, options: NSKeyValueObservingOptions = [], context: UnsafeMutableRawPointer?) {
        addObserverCallCount += 1
        addObserverLastKeyPathParam = keyPath
    }
    
    static func createOne(url: String) -> MockCustomPlayer {
        let item = MockPlayerItem.createOne(url: url)
        return MockCustomPlayer(overrideCurrentItem: item)
    }
    
    static func createOnUsingAsset(url: String) -> MockCustomPlayer {
        let item = MockPlayerItem.createOnUsingAsset(url: url)
        return MockCustomPlayer(overrideCurrentItem: item)
    }
}
