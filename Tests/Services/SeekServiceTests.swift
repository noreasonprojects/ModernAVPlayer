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

@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class SeekServiceTests: XCTestCase {

    private var service: ModernAVPlayerSeekService!

    override func setUp() {
        service = ModernAVPlayerSeekService()
    }

    func testBoundedPositionWithNoMedia() {
        // ARRANGE
        let position: Double = 0
        let media: PlayerMedia? = nil
        let duration: Double? = 42

        // ACT
        let boundedPosition = service.boundedPosition(position, media: media, duration: duration)

        // ASSERT
        let expectedReason: PlayerUnavailableActionReason = .loadMediaFirst
        XCTAssertEqual(boundedPosition.reason, expectedReason)
        XCTAssertNil(boundedPosition.value)
    }

    func testSeekBackward() {
        // ARRANGE
        let position: Double = -42
        let media = PlayerMediaMock()
        let duration: Double = 42

        // ACT
        let boundedPosition = service.boundedPosition(position, media: media, duration: duration)

        // ASSERT
        XCTAssertEqual(boundedPosition.value, 0)
        XCTAssertNil(boundedPosition.reason)
    }

    func testSeekForward() {
        // ARRANGE
        let position: Double = 42
        let media = PlayerMediaMock()
        let duration: Double? = nil

        // ACT
        let boundedPosition = service.boundedPosition(position, media: media, duration: duration)

        // ASSERT
        let expectedReason: PlayerUnavailableActionReason = .itemDurationNotSet
        XCTAssertEqual(boundedPosition.reason, expectedReason)
        XCTAssertNil(boundedPosition.value)
    }

    func testSeekExceed() {
        // ARRANGE
        let position: Double = 42
        let media = PlayerMediaMock()
        let duration: Double = 40

        // ACT
        let boundedPosition = service.boundedPosition(position, media: media, duration: duration)

        // ASSERT
        let expectedReason: PlayerUnavailableActionReason = .positionExceed
        XCTAssertEqual(boundedPosition.reason, expectedReason)
        XCTAssertNil(boundedPosition.value)
    }

    func testSeek() {
        // ARRANGE
        let position: Double = 21
        let media = PlayerMediaMock()
        let duration: Double? = 42

        // ACT
        let boundedPosition = service.boundedPosition(position, media: media, duration: duration)

        // ASSERT
        XCTAssertEqual(boundedPosition.value, position)
        XCTAssertNil(boundedPosition.reason)
    }
}
