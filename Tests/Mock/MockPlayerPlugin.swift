//
//  MockPlayerPlugin.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 02/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

/*
 * Failed to compile SwiftyMocky protocol with optional method parameter
 * so I created manually this mock
*/

final class MockPlayerPlugin: PlayerPlugin {

    private(set) var didPausedCallCount = 0
    var didPausedLastMediaParam: PlayerMedia?
    var didPausedLastPositionParam: Double?
    func didPaused(media: PlayerMedia?, position: Double) {
        didPausedCallCount += 1
        didPausedLastMediaParam = media
        didPausedLastPositionParam = position
    }

    private(set) var didStoppedCallCount = 0
    var didStoppedLastMediaParam: PlayerMedia?
    var didStoppedLastPositionParam: Double?
    func didStopped(media: PlayerMedia?, position: Double) {
        didStoppedCallCount += 1
        didStoppedLastMediaParam = media
        didStoppedLastPositionParam = position
    }
}
