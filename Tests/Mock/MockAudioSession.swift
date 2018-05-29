//
//  MockAudioSession.swift
//  RFAVPlayer_Example
//
//  Created by Jean-Charles Dessaint on 18/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

final class MockAudioSession: AudioSessionService {
    static func resetCallsCount() {
        activateCallCount = 0
        setCategoryCallCount = 0
    }
    
    static var activateCallCount = 0
    static func activate() {
        activateCallCount += 1
    }
    
    static var setCategoryCallCount = 0
    static func setCategory(_ category: String) {
        setCategoryCallCount += 1
    }
}
