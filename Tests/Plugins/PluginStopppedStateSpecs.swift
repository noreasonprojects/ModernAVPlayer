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

final class PluginStopppedStateSpecs: XCTestCase {

    private var context: PlayerContextMock!
    private var media: MockPlayerMedia!
    private var plugin: MockPlayerPlugin!
    private let position: Double = 42

    override func setUp() {
        media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)

        plugin = MockPlayerPlugin()

        context = PlayerContextMock()
        Given(context, .config(getter: ModernAVPlayerConfiguration()))
        Given(context, .currentMedia(getter: media))
        Given(context, .currentTime(getter: position))
        Given(context, .player(getter: MockCustomPlayer()))
        Given(context, .plugins(getter: [plugin]))
    }

    func testInitState_DidStoppedPluginShouldNotBeCall() {
        // ACT
        _ = StoppedState(context: context)

        // EXPECT
        XCTAssertEqual(plugin.didStoppedCallCount, 0)
    }

    func testWhenContextUpdated_DidStoppedPluginShouldBeCall() {
        // ARRANGE
        let state = StoppedState(context: context)

        // ACT
        state.contextUpdated()

        // EXPECT
        XCTAssertEqual(plugin.didStoppedCallCount, 1)
        XCTAssertEqual(plugin.didStoppedLastParams?.media as? MockPlayerMedia, media)
        XCTAssertEqual(plugin.didStoppedLastParams?.position, position)
    }
}
