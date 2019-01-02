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
    private(set) var didPausedLastParams: (media: PlayerMedia?, position: Double?)?
    func didPaused(media: PlayerMedia?, position: Double) {
        didPausedCallCount += 1
        didPausedLastParams = (media: media, position: position)
    }

    private(set) var didStoppedCallCount = 0
    private(set) var didStoppedLastParams: (media: PlayerMedia?, position: Double?)?
    func didStopped(media: PlayerMedia?, position: Double) {
        didStoppedCallCount += 1
        didStoppedLastParams = (media: media, position: position)
    }
}
