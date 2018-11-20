//
//  PluginInitStateSpecs.swift
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

final class PluginInitStateSpecs: XCTestCase {

    private var context: PlayerContextMock!
    private var plugin: PlayerPluginMock!
    private var player: MockCustomPlayer!

    override func setUp() {
        player = MockCustomPlayer()
        plugin = PlayerPluginMock()

        context = PlayerContextMock()
        Given(context, .player(getter: player))
        Given(context, .plugins(getter: [plugin]))
    }

    func testInitState_DidInitPluginShouldNotBeCall() {
        // ACT
        _ = InitState(context: context)

        // ASSERT
        Verify(plugin, 0, .didInit(player: .any))
    }

    func testWhenContextUpdated_DidInitPluginShouldBeCall() {
        // ARRANGE
        let state = InitState(context: context)

        // ACT
        state.contextUpdated()

        // ASSERT
        Verify(plugin, 1, .didInit(player: .value(player)))
    }
}
