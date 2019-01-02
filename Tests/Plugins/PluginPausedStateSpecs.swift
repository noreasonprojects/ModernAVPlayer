//
//  PluginPausedStateSpecs.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 09/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class PluginPausedStateSPecs: XCTestCase {

    private var context: PlayerContextMock!
    private var media: MockPlayerMedia!
    private var plugin: MockPlayerPlugin!
    private let position: Double = 42

    override func setUp() {
        media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)

        plugin = MockPlayerPlugin()

        context = PlayerContextMock()
        Given(context, .currentMedia(getter: media))
        Given(context, .currentTime(getter: position))
        Given(context, .player(getter: MockCustomPlayer()))
        Given(context, .plugins(getter: [plugin]))
    }

    func testInitState_DidPausedPluginShouldNotBeCall() {
        // ACT
        _ = PausedState(context: context)

        // EXPECT
        XCTAssertEqual(plugin.didPausedCallCount, 0)
    }

    func testWhenContextUpdated_DidPausedPluginShouldBeCall() {
        // ARRANGE
        let state = PausedState(context: context)

        // ACT
        state.contextUpdated()

        // EXPECT
        XCTAssertEqual(plugin.didPausedCallCount, 1)
        XCTAssertEqual(plugin.didPausedLastParams?.media as? MockPlayerMedia, media)
        XCTAssertEqual(plugin.didPausedLastParams?.position, position)
    }
}
