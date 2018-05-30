//
//  MockPlayerPlugin.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 30/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
@testable
import ModernAVPlayer

final class MockPlayerPlugin: PlayerPlugin {
    
    private(set) var didInitCallCount = 0
    private(set) var didInitLastParam: AVPlayer?
    func didInit(player: AVPlayer) {
        didInitCallCount += 1
        didInitLastParam = player
    }
    
    private(set) var didLoadmediaCallCount = 0
    private(set) var didLoadMediaLastParam: ModernAVPlayerMedia?
    func didLoadMedia(_ media: PlayerMedia?) {
        didLoadmediaCallCount += 1
        didLoadMediaLastParam = media as? ModernAVPlayerMedia
    }
}
