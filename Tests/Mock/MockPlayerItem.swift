// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// MockPlayerItem.swift
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

final class MockPlayerItem: AVPlayerItem {

    convenience init(url: URL, duration: CMTime?, status: AVPlayerItem.Status?) {
        self.init(url: url)
        overrideDuration = duration
        overrideStatus = status
    }
    
    convenience init(asset: AVAsset, duration: CMTime?, status: AVPlayerItem.Status?) {
        self.init(asset: asset)
        overrideDuration = duration
        overrideStatus = status
    }
    
    var overrideStatus: AVPlayerItem.Status?
    override var status: AVPlayerItem.Status {
        return overrideStatus ?? .unknown
    }
    
    private(set) var cancelPendingSeeksCallCount = 0
    override func cancelPendingSeeks() {
        cancelPendingSeeksCallCount += 1
    }
    
    private(set) var overrideDuration: CMTime?
    override var duration: CMTime {
        return overrideDuration ?? CMTime.zero
    }
}

extension MockPlayerItem {
    
    static func createOne(url: String, duration: CMTime? = nil, status: AVPlayerItem.Status? = nil) -> MockPlayerItem {
        let url = URL(string: url)!
        return MockPlayerItem(url: url, duration: duration, status: status)
    }
    
    static func createOnUsingAsset(url: String, duration: CMTime? = nil, status: AVPlayerItem.Status? = nil) -> MockPlayerItem {
        let url = URL(string: url)!
        let asset = MockAVAsset(url: url)
        return MockPlayerItem(asset: asset, duration: duration, status: status)
    }
}
