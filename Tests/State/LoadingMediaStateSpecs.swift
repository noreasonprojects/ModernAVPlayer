// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// LoadingMediaStateSpecs.swift
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

final class LoadingMediaStateTests: XCTestCase {

    private var context: PlayerContextMock!
    private var contextDelegate: PlayerContextDelegateMock!
    private var state: LoadingMediaState!
    private var player: MockCustomPlayer!
    private var media: PlayerMediaMock!
    private var audioSession: AudioSessionServiceMock!
    private let autostart = true
    private var plugin: PlayerPluginMock!
    private var interruptionService: InterruptionAudioService!

    override func setUp() {
        ModernAVPlayerLogger.setup.domains = []
        player = MockCustomPlayer.createOnUsingAsset(url: "foo")
        context = PlayerContextMock()
        contextDelegate = PlayerContextDelegateMock()
        media = PlayerMediaMock()
        media.matcher.register(PlayerMedia.self, match: matchPlayerMedia)
        audioSession = AudioSessionServiceMock()
        plugin = PlayerPluginMock()
        interruptionService = InterruptionAudioServiceMock()

        Given(context, .config(getter: ModernAVPlayerConfiguration()))
        Given(context, .audioSession(getter: audioSession))
        Given(context, .player(getter: player))
        Given(context, .delegate(getter: contextDelegate))
        Given(context, .plugins(getter: [plugin]))
        Given(context, .failedUsedAVPlayerItem(getter: []))
        Given(media, .url(getter: URL(string: "foo")!))

        state = LoadingMediaState(context: context, media: media, autostart: autostart,
                                  position: 42, interruptionAudioService: interruptionService)
    }

    func testContextUpdated() {
        // ARRANGE
        Given(context, .currentMedia(getter: media))

        // ACT
        state.contextUpdated()

        // ASSERTS
        XCTAssertEqual(player.pauseCallCount, 1)
        XCTAssertEqual(player.replaceCurrentItemCallCount, 2)
        XCTAssertNotNil(player.replaceCurrentItemLastParam)
        Verify(audioSession, .once, .activate())
    }

    func testContextUpdatedShouldSetInterruptionAudioServiceCallback() {
        // ARRANGE
        Given(context, .currentMedia(getter: media))

        // ACT
        state.contextUpdated()

        // ASSERTS
        XCTAssertNotNil(interruptionService.onInterruptionBegan)
    }

    func testContextUpdatedShouldStartBackgroundTask() {
        // ARRANGE
        Given(context, .currentMedia(getter: media))

        // ACT
        state.contextUpdated()

        // ASSERTS
        XCTAssertNotNil(context.bgToken)
    }

    func testContextUpdatedShouldNotifyPlugins() {
        // ARRANGE
        Given(context, .currentMedia(getter: media))

        // ACT
        state.contextUpdated()

        // ASSERTS
        Verify(plugin, .once, .willStartLoading(media: .value(media)))
        Verify(plugin, .once, .didStartLoading(media: .value(media)))
    }

    func testPauseCall() {
        // ACT
        state.pause()

        // ASSERT
        Verify(context, .once, .changeState(state: .matching { $0 is PausedState }))
        XCTAssertEqual(player.replaceCurrentItemCallCount, 1)
        XCTAssertNil(player.replaceCurrentItemLastParam)
    }

    func testPauseCallShouldCancelLoadingMedia() {
        // ARRANGE
        let item = MockPlayerItem.createOnUsingAsset(url: "foo")
        Given(context, .currentItem(getter: item))

        // ACT
        state.pause()

        // ASSERTS
        let asset = (item.asset as? MockAVAsset)
        XCTAssertEqual(asset?.cancelLoadingCallCount, 1)
        XCTAssertEqual(item.cancelPendingSeeksCallCount, 1)
        XCTAssertEqual(player.replaceCurrentItemCallCount, 1)
        XCTAssertNil(player.replaceCurrentItemLastParam)
    }

    func testStopCall() {
        // ACT
        state.stop()

        // ASSERT
        Verify(context, .once, .changeState(state: .matching { $0 is StoppedState }))
    }

    func testStopCallShouldCancelLoadingMedia() {
        // ARRANGE
        let item = MockPlayerItem.createOnUsingAsset(url: "foo")
        Given(context, .currentItem(getter: item))

        // ACT
        state.stop()

        // ASSERTS
        let asset = (item.asset as? MockAVAsset)
        XCTAssertEqual(asset?.cancelLoadingCallCount, 1)
        XCTAssertEqual(item.cancelPendingSeeksCallCount, 1)
        XCTAssertEqual(player.replaceCurrentItemCallCount, 1)
        XCTAssertNil(player.replaceCurrentItemLastParam)
    }

    func testPlayCall() {
        // ACT
        state.play()

        // ASSERT
        Verify(contextDelegate, .once, .playerContext(unavailableActionReason: .value(.waitLoadedMedia)))
    }

    func testSeekCall() {
        // ACT
        state.seek(position: 42, isAccurate: false)

        // ASSERT
        Verify(contextDelegate, .once, .playerContext(unavailableActionReason: .value(.waitLoadedMedia)))
    }
}
