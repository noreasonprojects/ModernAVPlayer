//
//  PluginLoadingStateSpecs.swift
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

final class PluginLoadingStateSpecs: XCTestCase {

    private var context: PlayerContextMock!
    private var plugin: PlayerPluginMock!
    private var player: MockCustomPlayer!
    private var media: PlayerMediaMock!
    private let error = PlayerError.loadingFailed

    override func setUp() {
        player = MockCustomPlayer()
        plugin = PlayerPluginMock()

        media = PlayerMediaMock()
        media.matcher.register(PlayerMedia.self, match: matchPlayerMedia)
        Given(media, .url(getter: URL(string: "foo")!))

        context = PlayerContextMock()
        Given(context, .currentMedia(getter: media))
        Given(context, .player(getter: player))
        Given(context, .plugins(getter: [plugin]))
        Given(context, .audioSession(getter: ModernAVPlayerAudioSessionService()))
    }

    func testInitState_DidFailedPluginShouldNotBeCall() {
        // ACT
        _ = LoadingMediaState(context: context, media: media, autostart: false)

        // ASSERT
        Verify(plugin, 0, .willStartLoading(media: .any))
        Verify(plugin, 0, .didStartLoading(media: .any))
    }

    func testWhenContextUpdated_DidFailedPluginShouldBeCall() {
        // ARRANGE
        let state = LoadingMediaState(context: context, media: media, autostart: false)

        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(plugin, 1, .willStartLoading(media: .value(media)))
        Verify(plugin, 1, .didStartLoading(media: .value(media)))
    }
}
