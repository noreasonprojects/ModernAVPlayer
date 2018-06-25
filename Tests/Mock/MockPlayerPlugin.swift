// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// MockPlayerPlugin.swift
// Created by raphael ankierman on 30/05/2018.
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
@testable
import ModernAVPlayer

final class MockPlayerPlugin: PlayerPlugin {
    
    private(set) var didStartLoadingCallCount = 0
    func didStartLoading() {
        didStartLoadingCallCount += 1
    }
    
    private(set) var didStartBufferingCallCount = 0
    func didStartBuffering() {
        didStartBufferingCallCount += 1
    }
    
    private(set) var didStartPlayingCallCount = 0
    func didStartPlaying() {
        didStartPlayingCallCount += 1
    }
    
    private(set) var didPausedCallCount = 0
    func didPaused() {
        didPausedCallCount += 1
    }
    
    private(set) var didStoppedCallCount = 0
    func didStopped() {
        didStoppedCallCount += 1
    }
    
    private(set) var didStartWaitingCallCount = 0
    func didStartWaitingForNetwork() {
        didStartWaitingCallCount += 1
    }
    
    private(set) var didFailedCallCount = 0
    func didFailed() {
        didFailedCallCount += 1
    }
    
    private(set) var didInitCallCount = 0
    private(set) var didInitLastParam: AVPlayer?
    func didInit(player: AVPlayer) {
        didInitCallCount += 1
        didInitLastParam = player
    }
    
    private(set) var didLoadCallCount = 0
    private(set) var didLoadLastMediaParam: PlayerMedia<PlayerMediaMetadata>?
    private(set) var didLoadLastDurationParam: Double?
    func didLoad<T: PlayerMediaMetadata>(media: PlayerMedia<T>?, duration: Double?) {
        didLoadCallCount += 1
        didLoadLastMediaParam = media as? PlayerMedia<PlayerMediaMetadata>
        didLoadLastDurationParam = duration
    }
}
