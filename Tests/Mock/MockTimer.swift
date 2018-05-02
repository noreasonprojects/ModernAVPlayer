//
//  MockTimer.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 30/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
import Foundation
import Quick
@testable
import ModernAVPlayer
import Nimble

final class MockTimer: TimerProtocol {
    
    var fire_CallCount = 0
    func fire() {
        fire_CallCount += 1
    }
    
    var invalidate_CallCount = 0
    func invalidate() {
        invalidate_CallCount += 1
    }
}

final class MockTimerFactory: TimerFactoryProtocol {
    
    var lastCompletion: (() -> Void)?
    var timer =  MockTimer()
    func getTimer(timeInterval: TimeInterval, repeats: Bool, block: @escaping () -> Void) -> TimerProtocol {
        lastCompletion = block
        return timer
    }
}

