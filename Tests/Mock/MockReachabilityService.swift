//
//  MockReachabilityService.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 22/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import ModernAVPlayer

final class MockReachability: ReachabilityServiceProtocol {
    var isReachable: ((Bool) -> Void)?
    var isTimedOut: (() -> Void)?
    
    var start_callCount = 0
    func start() {
        start_callCount += 1
    }
}
