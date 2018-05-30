//
//  MockObservingRateService.swift
//  RFAVPlayer_Example
//
//  Created by Jean-Charles Dessaint on 20/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
import Foundation
import Quick
@testable import ModernAVPlayer
import Nimble

final class MockObservingRateService: RateObservingService {
    init(config: PlayerConfiguration, item: AVPlayerItem) {
    }
    
    private(set) var startCallCount = 0
    func start() {
        startCallCount += 1
    }
    
    var onPlaying: (() -> Void)?
    
    var onTimeout: (() -> Void)?
    
    
}
