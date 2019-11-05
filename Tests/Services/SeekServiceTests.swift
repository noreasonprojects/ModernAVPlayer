// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// SeekServiceTests.swift
// Created by raphael ankierman on 03/05/2018.
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

import CoreMedia
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class SeekServiceTests: XCTestCase {

    private var service: ModernAVPlayerSeekService!
    private let preferedTimeScale = CMTimeScale(NSEC_PER_SEC)

    override func setUp() {
        service = ModernAVPlayerSeekService(preferredTimescale: preferedTimeScale)
    }

    func testSeekBackward() {
        // ARRANGE
        let position: Double = -1
        let item = MockPlayerItem(url: URL(fileURLWithPath: ""))

        // ACT
        let boundedPosition = service.boundedPosition(position, item: item)

        // ASSERT
        XCTAssertEqual(boundedPosition.value, 0)
        XCTAssertNil(boundedPosition.reason)
    }

    func testSeekForward() {
        // ARRANGE
        let position: Double = 42
        let duration = Double.infinity
        let item = MockPlayerItem(url: URL(fileURLWithPath: ""))
        item.overrideDuration = CMTime(seconds: duration, preferredTimescale: preferedTimeScale)

        // ACT
        let boundedPosition = service.boundedPosition(position, item: item)

        // ASSERT
        let expectedReason: PlayerUnavailableActionReason = .seekPositionNotAvailable
        XCTAssertEqual(boundedPosition.reason, expectedReason)
        XCTAssertNil(boundedPosition.value)
    }

    func testSeekExceed() {
        // ARRANGE
        let position: Double = 42
        let duration: Double = 40
        let item = MockPlayerItem(url: URL(fileURLWithPath: ""))
        item.overrideDuration = CMTime(seconds: duration, preferredTimescale: preferedTimeScale)

        // ACT
        let boundedPosition = service.boundedPosition(position, item: item)

        // ASSERT
        let expectedReason: PlayerUnavailableActionReason = .seekOverstepPosition
        XCTAssertEqual(boundedPosition.reason, expectedReason)
        XCTAssertNil(boundedPosition.value)
    }

    func testUsualSeek() {
        // ARRANGE
        let position: Double = 21
        let duration: Double = 42
        let item = MockPlayerItem(url: URL(fileURLWithPath: ""))
        item.overrideDuration = CMTime(seconds: duration, preferredTimescale: preferedTimeScale)

        // ACT
        let boundedPosition = service.boundedPosition(position, item: item)

        // ASSERT
        XCTAssertEqual(boundedPosition.value, position)
        XCTAssertNil(boundedPosition.reason)
    }
}
