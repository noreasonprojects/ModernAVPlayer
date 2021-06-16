// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// WaitingNetworkStateSpecs.swift
// Created by raphael ankierman on 22/05/2018.
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
import SwiftyMocky
import XCTest

final class WaitingNetworkStateTest: XCTestCase {

    private var state: WaitingNetworkState!
    private var mockPlayer = MockCustomPlayer()
    private var url: URL!
    private var playerMedia: PlayerMediaItemMock!
    private var reachability: ReachabilityServiceMock!
    private var context: PlayerContextMock!
    private var contextDelegate: PlayerContextDelegateMock!
    private let item = AVPlayerItem(url: URL(string: "https://en.wikipedia.org/wiki/Feminism")!)

    override func setUp() {
        ModernAVPlayerLogger.setup.domains = []

        playerMedia = PlayerMediaItemMock()
        Given(playerMedia, .item(getter: item))

        contextDelegate = PlayerContextDelegateMock()
        reachability = ReachabilityServiceMock()

        context = PlayerContextMock()
        Given(context, .delegate(getter: contextDelegate))
        Given(context, .player(getter: AVPlayer()))
        Given(context, .config(getter: ModernAVPlayerConfiguration()))
        Given(context, .currentMedia(getter: playerMedia))
        Given(context, .plugins(getter: []))
        Given(context, .failedUsedAVPlayerItem(getter: []))

        state = WaitingNetworkState(context: context,
                                    autostart: true,
                                    error: PlayerError.loadingFailed,
                                    reachabilityService: reachability)
    }

    func testStartReachability() {
        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(reachability, 1, .start())
    }

    func testPlay() {
        // ACT
        state.play()

        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.waitEstablishedNetwork)))
    }

    func testSeek() {
        // ACT
        state.seek(position: 0, isAccurate: false)

        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.waitEstablishedNetwork)))
    }

    func testPause() {
        // ACT
        state.pause()

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is PausedState }))
    }

    func testStop() {
        // ACT
        state.stop()

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is StoppedState }))
    }

    func testLoadingMedia() {
        // ACT
        state.load(media: playerMedia, autostart: false)

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is LoadingMediaState }))
    }

    func testIsTimeOut() {
        // ACT
        reachability.isTimedOut?()

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is FailedState }))
    }

    func testIsReachable() {
        // ACT
        reachability.isReachable?()

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is LoadingMediaState }))
    }

    func testFailedUsedAVPlayerItem() {
        // ACT
        state.contextUpdated()

        // ASSERT
        XCTAssert(context.failedUsedAVPlayerItem.contains(item))
    }
}
