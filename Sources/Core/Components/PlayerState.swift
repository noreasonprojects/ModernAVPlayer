//
//  PlayerState.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 21/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public protocol PlayerState {
    var context: PlayerContext { get }
    
    func loadMedia(media: PlayerMedia, shouldPlaying: Bool)
    func pause()
    func play()
    func seek(position: Double)
    func stop()
}

public extension PlayerState {
    var description: String {
        return String(describing: Self.self)
    }
}
