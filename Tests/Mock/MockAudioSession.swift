//
//  MockAudioSession.swift
//  RFAVPlayer_Example
//
//  Created by Jean-Charles Dessaint on 18/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

final class MockAudioSession: AudioSession {
    static func resetCallsCount() {
        activeCallCount = 0
        setCategoryCallCount = 0
    }
    
    static var activeCallCount = 0
    static var activeLastCompletion: ((Bool) -> Void)?
    static func active(completion: @escaping (Bool) -> Void) {
        activeCallCount += 1
        activeLastCompletion = completion
    }
    
    static var setCategoryCallCount = 0
    static func setCategory(_ category: String) {
        setCategoryCallCount += 1
    }
}
