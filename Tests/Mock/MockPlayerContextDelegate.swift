//
//  MockPlayerContextDelegate.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 26/07/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

final class MockPlayerContextDelegate: PlayerContextDelegate {

    private (set) var didStateChangeCallCount = 0
    private (set) var didStateChangeLastParam: ModernAVPlayer.State?
    func playerContext(didStateChange state: ModernAVPlayer.State) {
        didStateChangeCallCount += 1
        didStateChangeLastParam = state
    }
    
    private (set) var didCurrentMediaChangeCallCount = 0
    private (set) var didCurrentMediaChangeLastParam: PlayerMedia?
    func playerContext(didCurrentMediaChange media: PlayerMedia?) {
        didCurrentMediaChangeCallCount += 1
        didCurrentMediaChangeLastParam = media
    }
    
    private (set) var didCurrentTimeChangeCallCount = 0
    private (set) var didCurrentTimeChangeLastParam: Double?
    func playerContext(didCurrentTimeChange currentTime: Double) {
        didCurrentTimeChangeCallCount += 1
        didCurrentTimeChangeLastParam = currentTime
    }

    private (set) var didItemDurationChangeCallCount = 0
    private (set) var didItemDurationChangeLastParam: Double?
    func playerContext(didItemDurationChange itemDuration: Double?) {
        didItemDurationChangeCallCount += 1
        didItemDurationChangeLastParam = itemDuration
    }
    
    func playerContext(debugMessage: String?) { }
    
    private (set) var didItemPlayToEndTimeCallCount = 0
    private (set) var didItemPlayToEndTimeLastParam: Double?
    func playerContext(didItemPlayToEndTime endTime: Double) {
        didItemPlayToEndTimeCallCount += 1
        didItemPlayToEndTimeLastParam = endTime
    }
}
