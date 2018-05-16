//
//  AudioSessionService.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 21/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public protocol AudioSession {
    static func active(completion: @escaping (Bool) -> Void)
    static func setCategory(_ category: String)
}

public struct AudioSessionService: AudioSession {

    static public func active(completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                LoggerInHouse.instance.log(message: "Active audio session", event: .info)
                completion(true)
            } catch {
                LoggerInHouse.instance.log(message: "Active audio session: \(error.localizedDescription)", event: .error)
                completion(false)
            }
        }
    }

    static public func setCategory(_ category: String) {
        do {
            try AVAudioSession.sharedInstance().setCategory(category)
            LoggerInHouse.instance.log(message: "Set audio session category to: \(category)", event: .info)
        } catch let error {
            LoggerInHouse.instance.log(message: "Set \(category) category: \(error.localizedDescription)", event: .error)
        }
    }

}
