// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// FailedStateSpecs.swift
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
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class FailedStateTests: XCTestCase {

    private var state: FailedState!
    private var playerMedia: PlayerMediaItemMock!
    private var context: PlayerContextMock!
    private var contextDelegate: PlayerContextDelegateMock!
    private let error = PlayerError.loadingFailed
    private let item = AVPlayerItem(url: URL(string: "https://en.wikipedia.org/wiki/Feminism")!)

    override func setUp() {
        ModernAVPlayerLogger.setup.domains = []

        playerMedia = PlayerMediaItemMock()
        Given(playerMedia, .item(getter: item))

        contextDelegate = PlayerContextDelegateMock()

        context = PlayerContextMock()
        Given(context, .delegate(getter: contextDelegate))
        Given(context, .currentMedia(getter: playerMedia))
        Given(context, .plugins(getter: []))
        Given(context, .failedUsedAVPlayerItem(getter: []))

        state = FailedState(context: context, error: error)
    }

    func testStop() {
        // ACT
        state.stop()

        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }

    func testPause() {
        // ACT
        state.pause()

        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }

    func testPlay() {
        // ACT
        state.play()

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is LoadingMediaState } ))
    }

    func testLoadMedia() {
        // ACT
        state.load(media: playerMedia, autostart: false)

        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is LoadingMediaState } ))
    }

    func testSeek() {
        // ACT
        state.seek(position: 0, isAccurate: false)

        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }

    func testFailedUsedAVPlayerItem() {
        // ACT
        state.contextUpdated()

        // ASSERT
        XCTAssert(context.failedUsedAVPlayerItem.contains(item))
    }

}
