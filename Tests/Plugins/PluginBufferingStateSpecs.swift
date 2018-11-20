//
//  PluginBufferingStateSpecs.swift
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

final class PluginBufferingStateSpecs: XCTestCase {

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
        Given(context, .player(getter: player))
        Given(context, .plugins(getter: [plugin]))
        Given(context, .currentItem(getter: MockPlayerItem.createOne(url: "foo")))
        Given(context, .currentMedia(getter: media))
        Given(context, .currentTime(getter: 42.0))
        Given(context, .config(getter: ModernAVPlayerConfiguration()))
    }

    func testInitState_DidStartBufferingPluginShouldNotBeCall() {
        // ACT
        _ = BufferingState(context: context)

        // ASSERT
        Verify(plugin, 0, .didStartBuffering(media: .any))
    }

    func testWhenContextUpdated_DidStartBufferingPluginShouldBeCall() {
        // ARRANGE
        let state = BufferingState(context: context)

        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(plugin, 1, .didStartBuffering(media: .value(media)))
    }
}
