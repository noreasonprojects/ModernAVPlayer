//
//  PluginFailedStateSpecs.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 19/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class PluginFailedStateSpecs: XCTestCase {

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
    }

    func testInitState_DidFailedPluginShouldNotBeCall() {
        // ACT
        _ = FailedState(context: context, error: error)

        // ASSERT
        Verify(plugin, 0, .didFailed(media: .any, error: .any))
    }

    func testWhenContextUpdated_DidFailedPluginShouldBeCall() {
        // ARRANGE
        let state = FailedState(context: context, error: error)
        Given(context, .currentMedia(getter: media))

        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(plugin, 1, .didFailed(media: .value(media), error: .value(error)))
    }
}
