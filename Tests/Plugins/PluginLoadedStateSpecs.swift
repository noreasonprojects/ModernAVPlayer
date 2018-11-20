//
//  PluginLoadedStateSpecs.swift
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

final class PluginLoadedStateSpecs: XCTestCase {

    private var context: PlayerContextMock!
    private var plugin: PlayerPluginMock!
    private var player: MockCustomPlayer!
    private var media: PlayerMediaMock!
    private let itemDuration: Double = 42

    override func setUp() {
        player = MockCustomPlayer()
        plugin = PlayerPluginMock()

        media = PlayerMediaMock()
        media.matcher.register(PlayerMedia.self, match: matchPlayerMedia)
        Given(media, .url(getter: URL(string: "foo")!))
        Given(media, .type(getter: MediaType.clip))
        Given(media, .isLive(willReturn: false))

        context = PlayerContextMock()
        Given(context, .player(getter: player))
        Given(context, .plugins(getter: [plugin]))
        Given(context, .currentMedia(getter: media))
        Given(context, .itemDuration(getter: itemDuration))
        Given(context, .nowPlaying(getter: ModernAVPlayerNowPlayingService()))
    }

    func testInitState_DidLoadPluginShouldNotBeCall() {
        // ACT
        _ = LoadedState(context: context)

        // ASSERT
        Verify(plugin, 0, .didLoad(media: .any, duration: .any))
    }

    func testWhenContextUpdated_DidLoadPluginShouldBeCall() {
        // ARRANGE
        let state = LoadedState(context: context)

        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(plugin, 1, .didLoad(media: .value(media), duration: .value(itemDuration)))
    }
}
