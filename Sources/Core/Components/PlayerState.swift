//
//  PlayerState.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 21/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

protocol PlayerStateProtocol {
    var context: PlayerContextProtocol { get }
    var type: ModernAVPlayer.State { get }
    
    func loadMedia(media: PlayerMediaProtocol, shouldPlaying: Bool)
    func pause()
    func play()
    func seek(position: Double)
    func stop()
}
