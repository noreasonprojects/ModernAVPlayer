//
//  PlayerContext.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

protocol PlayerContext: class {
    var player: AVPlayer { get }
    var config: ContextConfiguration { get }
    var currentItem: AVPlayerItem? { get set }
    var currentTime: Double? { get set }
    var itemDuration: Double? { get set }
    var state: PlayerState! { get }
    var debugMessage: String? { get set }
    var nowPlaying: NowPlaying { get }
    var bgToken: UIBackgroundTaskIdentifier? { get set }
    
    func pause()
    func play()
    func seek(position: Double)
    func stop()
    func loadMedia(media: PlayerMedia, shouldPlaying: Bool)
    func changeState(state: PlayerState)
    
    var audioSessionType: AudioSession.Type { get }
}
