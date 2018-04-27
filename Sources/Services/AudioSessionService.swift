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
                print("ΩΩΩ Active audio session")
                completion(true)
            } catch {
                print("ΩΩΩ Failed to active audio session: \(error.localizedDescription)")
                completion(false)
            }
        }
    }

    static public func setCategory(_ category: String) {
        do {
            try AVAudioSession.sharedInstance().setCategory(category)
            print("ΩΩΩ Set audio session category to: \(category)")
        } catch let error {
            print("ΩΩΩ Failed to set \(category) category: \(error.localizedDescription)")
        }
    }

}
