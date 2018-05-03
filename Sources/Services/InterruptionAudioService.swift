//
//  InterruptionAudioService.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 03/05/2018.
//

import AVFoundation
import Foundation

final class InterruptionAudioService {
    
    private let notificationName = Notification.Name.AVAudioSessionInterruption
    public var onInterruption: ((AVAudioSessionInterruptionType) -> Void)?
    
    public init() {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(incomingInterruption),
                                               name: notificationName,
                                               object: nil)
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
    
    @objc
    private func incomingInterruption(notification: Notification) {
        LoggerInHouse.instance.log(message: "Audio interruption detected", event: .info)
        
        guard
            let userInfo = notification.userInfo,
            let rawInterruptionType = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let interruptionType = AVAudioSessionInterruptionType(rawValue: rawInterruptionType)
            else { return }
        
        onInterruption?(interruptionType)
    }
}
