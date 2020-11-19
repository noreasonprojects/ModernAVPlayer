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
    private var context: ModernAVPlayerContext!
    private var state: PlayerStateMock!
    private var media: MockPlayerMedia!
    private var nowPlaying: NowPlayingMock!
    private var player: MockCustomPlayer!
    private let config = ModernAVPlayerConfiguration()
    private var delegate: PlayerContextDelegateMock!

    override func setUp() {
        player = MockCustomPlayer()
        delegate = PlayerContextDelegateMock()
        ModernAVPlayerLogger.setup.domains = []
        audioSession = AudioSessionServiceMock()
        nowPlaying = NowPlayingMock()
        context = ModernAVPlayerContext(player: player, config: config, nowPlaying: nowPlaying,
                                       audioSession: audioSession, plugins: [])
        media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
        context.delegate = delegate

        state = PlayerStateMock()
        Given(state, .type(getter: .failed))
        Given(state, .context(getter: context))
    }

    func testCurrentItem() {
        // ARRANGE
        let duration = CMTime(seconds: 42, preferredTimescale: config.preferredTimescale)
        let item = MockPlayerItem(url: URL(fileURLWithPath: ""), duration: duration, status: nil)
        player.overrideCurrentItem = item

        // ACT
        let itemResponse = context.currentItem

        // ASERT
        XCTAssertEqual(item, itemResponse)
    }

    func testCurrentMediaDelegateCall() {
        // ACT
        context.currentMedia = media

        // ASSERT
        Verify(delegate, 1,
               .playerContext(didCurrentMediaChange: .matching { $0 as? MockPlayerMedia == self.media }))
    }

    func testCurrentTime() {
        // ARRANGE
        let currentTime = CMTime(seconds: 42, preferredTimescale: config.preferredTimescale)
        player.overrideCurrentTime = currentTime

        // ACT
        let currentTimeResponse = context.currentTime

        // ASSERT
        XCTAssertEqual(currentTime.seconds, currentTimeResponse)
    }

    func testCurrentItemDuration() {
        // ARRANGE
        let duration = CMTime(seconds: 42, preferredTimescale: config.preferredTimescale)
        let item = MockPlayerItem.createOne(url: "foo", duration: duration)
        player.overrideCurrentItem = item

        // ACT
        let durationResponse = context.currentItem?.duration

        // ASERT
        XCTAssertEqual(duration, durationResponse)
    }

    func testSetStateContextUpdatedCall() {
        // ACT
        context.changeState(state: state)

        // ASSERT
        Verify(state, 1, .contextUpdated())
    }

    func testSetStateDelegateCall() {
        // ACT
        context.changeState(state: state)

        // ASSERT
        Verify(delegate, 1, .playerContext(didStateChange: .value(state.type)))
    }

    func testCurrentInitState() {
        // ASSERT
        XCTAssertTrue(context.state is InitState)
    }

    func testSetCategoryOnInit() {
        // ASSERT
        Verify(self.audioSession, 1, .setCategory(.value(self.context.config.audioSessionCategory),
                                                  options: .value(self.context.config.audioSessionCategoryOptions)))
    }

    func testSetExternalPlayback() {
        // ARRANGE
        player.overrideAllowsExternalPlayback = config.allowsExternalPlayback
        
        // ASSERT
        XCTAssertEqual(player.allowsExternalPlayback, config.allowsExternalPlayback)
        // AVPlayer init allowsExternalPlayback property
        XCTAssertEqual(player.allowsExternalPlaybackCallCount, 2)
    }

    func testChangeState() {
        // ARRANGE
        Given(state, .type(getter: .loaded))

        // ACT
        context.changeState(state: state)

        // ASSERT
        XCTAssertEqual(context.state.type, .loaded)
    }

    func testPause() {
        // ARRANGE
        context.changeState(state: state)

        // ACT
        context.pause()

        // ASSERT
        Verify(state, 1, .pause())
    }

    func testPlay() {
        // ARRANGE
        context.changeState(state: state)

        // ACT
        context.play()

        // ASSERT
        Verify(state, 1, .play())
    }

    func testStop() {
        // ARRANGE
        context.changeState(state: state)

        // ACT
        context.stop()

        // ASSERT
        Verify(state, 1, .stop())
    }

    func testSeekWithNoCurrentItem() {
        // ARRANGE
        context.changeState(state: state)

        // ACT
        context.seek(position: 0)

        // ASSERT
        Verify(delegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }

    func testOverstepSeekPosition() {
        // ARRANGE
        let seekPosition: Double = 43
        let duration = CMTime(seconds: 42, preferredTimescale: config.preferredTimescale)
        player.overrideCurrentItem = MockPlayerItem(url: URL(fileURLWithPath: ""),
                                                    duration: duration, status: nil)

        // ACT
        context.seek(position: seekPosition)

        // ASSERT
        Verify(delegate, 1, .playerContext(unavailableActionReason: .value(.seekOverstepPosition)))
    }

    func testValidSeekPosition() {
        // ARRANGE
        let seekPosition: Double = 21
        let duration = CMTime(seconds: 42, preferredTimescale: config.preferredTimescale)
        player.overrideCurrentItem = MockPlayerItem(url: URL(fileURLWithPath: ""),
                                                    duration: duration, status: nil)
        context.changeState(state: state)

        // ACT
        context.seek(position: seekPosition)

        // ASSERT
        Verify(state, 1, .seek(position: .value(seekPosition)))
    }

    func testValidSeekOffset() {
        // ARRANGE
        let seekPosition = CMTime(seconds: 21, preferredTimescale: config.preferredTimescale)
        let duration = CMTime(seconds: 42, preferredTimescale: config.preferredTimescale)
        let offset: Double = 10
        player.overrideCurrentTime = seekPosition
        player.overrideCurrentItem = MockPlayerItem(url: URL(fileURLWithPath: ""),
                                                    duration: duration, status: nil)
        context.changeState(state: state)

        // ACT
        context.seek(offset: offset)

        // ASSERT
        let expected = seekPosition.seconds + offset
        Verify(state, 1, .seek(position: .value(expected)))
    }

    func testLoadMedia() {
        // ARRANGE
        let media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
        let autostart = true
        let position: Double = 56
        context.changeState(state: state)

        // ACT
        context.load(media: media, autostart: autostart, position: position)

        // ASSERT
        Verify(state, 1, .load(media: .matching { $0 as? MockPlayerMedia == media },
                               autostart: .value(autostart),
                               position: .value(position)))
    }

    func testUpdateMetadataSetMetadata() {
        // ARRANGE
        let media = PlayerMediaMock()
        context.currentMedia = media
        let metadata = MockPlayerMediaMetadata(title: "title",
                                               albumTitle: "album",
                                               artist: "artist",
                                               image: nil,
                                               remoteImageUrl: nil)

        // ACT
        context.updateMetadata(metadata)

        // ASSERT
        Verify(media, 1, .setMetadata(.matching { $0 as? MockPlayerMediaMetadata == metadata }))
    }

    func testUpdateMetadataNowPlayingInfo() {
        // ARRANGE
        context.currentMedia = media
        let metadata = MockPlayerMediaMetadata(title: "title",
                                               albumTitle: "album",
                                               artist: "artist",
                                               image: nil,
                                               remoteImageUrl: nil)

        // ACT
        context.updateMetadata(metadata)

        // ASSERT
        Verify(nowPlaying, 1, .update(metadata: .matching { $0 as? MockPlayerMediaMetadata == metadata }))
    }

    func testUpdateMetadataWithNoCurrentMedia() {
        // ARRANGE
        context.currentMedia = nil

        // ACT
        context.updateMetadata(nil)

        // ASSERT
        Verify(delegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }
}
