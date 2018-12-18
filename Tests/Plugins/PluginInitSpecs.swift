//
//  PluginInitStateSpecs.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 09/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
import Quick
@testable
import ModernAVPlayer
import Nimble
import SwiftyMocky

final class PluginInitSpecs: QuickSpec {

    private var player: AVPlayer!
    private var plugin: PlayerPluginMock!

    override func setUp() {
        self.player = MockCustomPlayer()
        self.plugin = PlayerPluginMock()
    }

    func testWhenInitContext_DidInitPluginShouldBeCall() {
        // ACT
        _ = ModernAVPlayerContext(player: self.player,
                                  config: ModernAVPlayerConfiguration(),
                                  plugins: [plugin])

        // ASSERT
        Verify(plugin, 1, .didInit(player: .value(player)))
    }
}
