//
//  PluginPlayerContextSpecs.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 19/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class PluginPlayerContextSpecs: XCTestCase {

    private var context: PlayerContext!
    private var plugin: PlayerPluginMock!
    private var player: MockCustomPlayer!

    override func setUp() {
        player = MockCustomPlayer()
        plugin = PlayerPluginMock()
        context = ModernAVPlayerContext(player: player,
                                        config: ModernAVPlayerConfiguration(),
                                        plugins: [plugin])
    }

    func testLoadMedia_DidFailedPluginShouldNotBeCall() {
        // ARRANGE
        let newMedia = PlayerMediaMock()
        newMedia.matcher.register(PlayerMedia.self, match: matchPlayerMedia)
        Given(newMedia, .url(getter: URL(string: "foo")!))

        // ACT
        context.load(media: newMedia, autostart: false, position: nil)

        // ASSERT
        Verify(plugin, 1, .didMediaChanged(.value(newMedia), previousMedia: .any))
    }
}
