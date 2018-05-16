//
//  RouteAudioService.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 03/05/2018.
//

import AVFoundation
import Foundation

public final class RouteAudioService {
 
    private let notificationName = NSNotification.Name.AVAudioSessionRouteChange
    public var onRouteChanged: ((AVAudioSessionRouteChangeReason) -> Void)?
    
    public init() {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(audioRouteChanged),
                                               name: notificationName,
                                               object: nil)
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
    
    @objc
    private func audioRouteChanged(notification: Notification) {
        LoggerInHouse.instance.log(message: "Update audio route detected", event: .info)
        guard
            let info = notification.userInfo,
            let reasonInt = info[AVAudioSessionRouteChangeReasonKey] as? UInt,
            let reason = AVAudioSessionRouteChangeReason(rawValue: reasonInt)
            else { return }
        
        onRouteChanged?(reason)
    }
}
