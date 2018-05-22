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
    
    final class TimerAdapter: TimerProtocol {
        
        private let block: (() -> Void)?
        private let repeats: Bool
        private let timeInterval: TimeInterval
        private lazy var innerTimer: TimerProtocol = {
            Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(executeBlock), userInfo: nil, repeats: repeats)
        }()
        
        init(timeInterval: TimeInterval, repeats: Bool, block: @escaping () -> Void) {
            self.block = block
            self.repeats = repeats
            self.timeInterval = timeInterval
            innerTimer.fire()
        }
        
        @objc
        func executeBlock() {
            block?()
        }
        
        func fire() {
            innerTimer.fire()
        }
        
        func invalidate() {
            innerTimer.invalidate()
        }
    }

    func getTimer(timeInterval: TimeInterval, repeats: Bool, block: @escaping () -> Void) -> TimerProtocol {
        return TimerAdapter(timeInterval: timeInterval, repeats: repeats, block: block)
    }
}
