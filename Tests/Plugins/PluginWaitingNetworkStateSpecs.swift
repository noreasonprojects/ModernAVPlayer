//
//  PluginWaitingNetworkStateSpecs.swift
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

final class PluginWaitingNetworkStateSpecs: XCTestCase {

    private var context: PlayerContextMock!
    private var media: PlayerMediaMock!
    private var plugin: PlayerPluginMock!

    override func setUp() {
        media = PlayerMediaMock()
        Given(media, .url(getter: URL(string: "foo")!))

        plugin = PlayerPluginMock()

        context = PlayerContextMock()
        Given(context, .currentMedia(getter: media))
        Given(context, .player(getter: MockCustomPlayer()))
        Given(context, .plugins(getter: [plugin]))
        Given(context, .config(getter: ModernAVPlayerConfiguration()))
    }

    func testInitState_DidStartWaitingForNetworkPluginShouldNotBeCall() {
        // ACT
        _ = WaitingNetworkState(context: context, urlToReload: media.url, autostart: false, error: .bufferingFailed)

        // EXPECT
        Verify(plugin, 0, .didStartWaitingForNetwork(media: .value(media)))
    }

    func testWhenContextUpdated_DidStartWaitingForNetworkPluginShouldBeCall() {
        // ARRANGE
        let state = WaitingNetworkState(context: context,
                                        urlToReload: media.url,
                                        autostart: false,
                                        error: .bufferingFailed)

        // ACT
        state.contextUpdated()

        // EXPECT
        Verify(plugin, 1, .didStartWaitingForNetwork(media: .value(media)))
    }

}
