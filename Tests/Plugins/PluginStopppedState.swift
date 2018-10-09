//
//  PluginStopppedState.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 09/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class PluginStopppedState: XCTestCase {

    private var context: PlayerContextMock!
    private var media: PlayerMediaMock!
    private var plugin: PlayerPluginMock!
    private let position: Double = 42

    override func setUp() {
        media = PlayerMediaMock()
        media.matcher.register(PlayerMedia.self, match: matchPlayerMedia)
        Given(media, .url(getter: URL(string: "foo")!))

        plugin = PlayerPluginMock()

        context = PlayerContextMock()
        Given(context, .currentMedia(getter: media))
        Given(context, .currentTime(getter: position))
        Given(context, .player(getter: MockCustomPlayer()))
        Given(context, .plugins(getter: [plugin]))
    }

    func testInitState_DidStoppedPluginShouldNotBeCall() {
        // ACT
        _ = StoppedState(context: context)

        // EXPECT
        Verify(plugin, 0, .didStopped(media: .any, position: .any))
    }

    func testWhenContextUpdated_DidStoppedPluginShouldBeCall() {
        // ARRANGE
        let state = StoppedState(context: context)

        // ACT
        state.contextUpdated()

        // EXPECT
        Verify(plugin, 1, .didStopped(media: .value(media), position: .value(position)))
    }
}
