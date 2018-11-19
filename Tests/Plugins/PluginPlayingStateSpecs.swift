//
//  PluginPlayingStateSpecs.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 19/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class PluginPlayingStateSpecs: XCTestCase {

    private var context: PlayerContextMock!
    private var plugin: PlayerPluginMock!
    private var player: MockCustomPlayer!
    private var media: PlayerMediaMock!
    private var playbackObervingService: PlaybackObservingServiceMock!
    private let currentTime: Double = 42

    override func setUp() {
        player = MockCustomPlayer()
        plugin = PlayerPluginMock()

        media = PlayerMediaMock()
        media.matcher.register(PlayerMedia.self, match: matchPlayerMedia)
        Given(media, .url(getter: URL(string: "foo")!))

        context = PlayerContextMock()
        Given(context, .player(getter: player))
        Given(context, .plugins(getter: [plugin]))
        Given(context, .currentMedia(getter: media))
        Given(context, .currentTime(getter: currentTime))
        Given(context, .loopMode(getter: false))
        Given(context, .config(getter: ModernAVPlayerConfiguration()))

        playbackObervingService = PlaybackObservingServiceMock()
    }

    func testInitState_DidStartPlayingPluginShouldNotBeCall() {
        // ACT
        _ = PlayingState(context: context, itemPlaybackObservingService: playbackObervingService)

        // ASSERT
        Verify(plugin, 0, .didStartPlaying(media: .any))
    }

    func testWhenContextUpdated_DidStartPlayingPluginShouldBeCall() {
        // ARRANGE
        let state = PlayingState(context: context, itemPlaybackObservingService: playbackObervingService)

        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(plugin, 1, .didStartPlaying(media: .value(media)))
    }

    func testWhenEndTimeOccured_DidPlayToEndTimePluginShouldBeCall() {
        // ARRANGE
        _ = PlayingState(context: context, itemPlaybackObservingService: playbackObervingService)

        // ACT
        playbackObervingService.onPlayToEndTime?()

        // ASSERT
        Verify(plugin, 1, .didItemPlayToEndTime(media: .value(media), endTime: .value(currentTime)))
    }
}
