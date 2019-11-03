// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayerContextTests.swift
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

final class PlayerContextTests: XCTestCase {

    private var audioSession: AudioSessionServiceMock!
    private var tested: PlayerContext!
    private var mockState: MockPlayerState!
    private var media: MockPlayerMedia!
    private var nowPlaying: MockNowPlayingService!
    private let player = MockCustomPlayer()

    override func setUp() {
        ModernAVPlayerLogger.setup.domains = []
        audioSession = AudioSessionServiceMock()
        nowPlaying = MockNowPlayingService()
        tested = ModernAVPlayerContext(player: player,
                                            config: ModernAVPlayerConfiguration(),
                                            nowPlaying: nowPlaying,
                                            audioSession: audioSession,
                                            plugins: [])
        mockState = MockPlayerState(context: tested)
        media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
    }

    func testCurrentInitState() {
        // ASSERT
        XCTAssertTrue(tested.state is InitState)
    }

    func testSetCategoryOnInit() {
        // ASSERT
        Verify(self.audioSession, 1, .setCategory(.value(self.tested.config.audioSessionCategory)))
    }

    func testPause() {
        // ARRANGE
        tested.changeState(state: mockState)

        // ACT
        tested.pause()

        // ASSERT
        XCTAssertEqual(mockState.pauseCallCount, 1)
    }

    func testPlay() {
        // ARRANGE
        tested.changeState(state: mockState)

        // ACT
        tested.play()

        // ASSERT
        XCTAssertEqual(mockState.playCallCount, 1)
    }

    func testStop() {
        // ARRANGE
        tested.changeState(state: mockState)

        // ACT
        tested.stop()

        // ASSERT
        XCTAssertEqual(mockState.stopCallCount, 1)
    }

//    func testSeek() {
//        // ARRANGE
//        tested.changeState(state: mockState)
//
//        // ACT
//        tested.seek(position: 42)
//
//        // ASSERT
//        XCTAssertEqual(mockState.seekCallCount, 1)
//        XCTAssertEqual(mockState.lastPositionParam, 42)
//    }

    func testSetCurrentMedia() {
        // ARRANGE
        let media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)

        // ACT
        tested.load(media: media, autostart: false, position: nil)

        // ASSERT
        XCTAssertEqual(tested.currentMedia as? MockPlayerMedia, media)
    }

    func testCallLoadMedia() {
        // ARRANGE
        tested.changeState(state: mockState)
        let media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
        let position = 42.0

        // ACT
        tested.load(media: media, autostart: false, position: position)

        // ASSERT
        XCTAssertEqual(mockState.loadMedialCallCount, 1)
        XCTAssert(mockState.lastLoadAutostartParam == false)
        XCTAssertEqual(mockState.lastLoadPositionParam, position)
    }

    func testChangeState() {
        // ARRANGE
        let newState = MockPlayerState(context: tested, state: .failed)

        // ACT
        tested.changeState(state: newState)

        // ASSERT
        XCTAssertEqual(tested.state.type, .failed)
    }

    func testContextUpdatedCall() {
        // ARRANGE
        let newState = MockPlayerState(context: tested)

        // ACT
        tested.changeState(state: newState)

        // ASSERT
        XCTAssertEqual(newState.contextUpdatedCallCount, 1)
    }

    func testUpdateMetadata() {
        // ARRANGE
        tested.currentMedia = media
        let metadata = MockPlayerMediaMetadata(title: "title",
                                               albumTitle: "album",
                                               artist: "artist",
                                               image: nil,
                                               remoteImageUrl: nil)

        // ACT
        tested.updateMetadata(metadata)

        // ASSERT
        XCTAssertEqual(media.setMetadataCallCount, 1)
        let expectedMetadata = MockPlayerMediaMetadata.convert(media.setMetadataLastParam!)
        XCTAssertEqual(expectedMetadata, metadata)
    }

    func testUpdateNowPlayingInfo() {
        // ARRANGE
        tested.currentMedia = media
        let metadata = MockPlayerMediaMetadata(title: "title",
                                               albumTitle: "album",
                                               artist: "artist",
                                               image: nil,
                                               remoteImageUrl: nil)

        // ACT
        tested.updateMetadata(metadata)

        // ASSERT
        XCTAssertEqual(nowPlaying.updateCallCount, 1)
        let expectedMetadata = MockPlayerMediaMetadata.convert(nowPlaying.updateLastMetadataParam!)
        XCTAssertEqual(expectedMetadata, metadata)
    }

    func testUpdateNowPlayingInfoWithNoCurrentMedia() {
        // ARRANGE
        tested.currentMedia = nil
        let metadata = MockPlayerMediaMetadata(title: "title",
                                               albumTitle: "album",
                                               artist: "artist",
                                               image: nil,
                                               remoteImageUrl: nil)

        // ACT
        tested.updateMetadata(metadata)

        // ASSERT
        XCTAssertEqual(media.setMetadataCallCount, 0)
        XCTAssertEqual(nowPlaying.updateCallCount, 0)
    }
}
