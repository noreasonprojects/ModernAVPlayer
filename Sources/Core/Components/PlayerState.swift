//
//  PlayerState.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 21/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

protocol PlayerState {
    var context: PlayerContextProtocol { get }
    var type: ModernAVPlayer.State { get }
    
    func loadMedia(media: PlayerMedia, shouldPlaying: Bool)
    func pause()
    func play()
    func seek(position: Double)
    func stop()
}
