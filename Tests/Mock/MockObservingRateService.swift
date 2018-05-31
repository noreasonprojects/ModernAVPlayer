//
//  MockObservingRateService.swift
//  RFAVPlayer_Example
//
//  Created by Jean-Charles Dessaint on 20/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
@testable
import ModernAVPlayer

final class MockObservingRateService: RateObservingService {
    var onPlaying: (() -> Void)?
    var onTimeout: (() -> Void)?
    
    init(config: PlayerConfiguration, item: AVPlayerItem) {
    }
    
    private(set) var startCallCount = 0
    func start() {
        startCallCount += 1
    }
    
    private(set) var stopCallCount = 0
    func stop(clearCallbacks: Bool) {
        stopCallCount += 1
    }
}
