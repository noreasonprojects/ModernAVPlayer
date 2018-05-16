//
//  TimerFactory.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 02/05/2018.
//

import Foundation

protocol TimerProtocol {
    func fire()
    func invalidate()
}

extension Timer: TimerProtocol { }

protocol TimerFactoryProtocol {
    func getTimer(timeInterval: TimeInterval, repeats: Bool, block: @escaping () -> Void) -> TimerProtocol
}

struct TimerFactory: TimerFactoryProtocol {
    
    func getTimer(timeInterval: TimeInterval, repeats: Bool, block: @escaping () -> Void) -> TimerProtocol {
        return Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: repeats) { _ in block() }
    }
}
