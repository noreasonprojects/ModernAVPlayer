//
//  PlayerContext.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 21/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

protocol PlayerContextDelegate: class {
    func playerContext(didStateChange state: ModernAVPlayer.State)
    func playerContext(didCurrentTimeChange currentTime: Double?)
    func playerContext(didItemDurationChange itemDuration: Double?)
    func playerContext(didCurrentItemUrlChange currentItemUrl: URL?)
    func playerContext(debugMessage: String?)
}

protocol PlayerContext: class {
    var player: AVPlayer { get }
    var plugins: [PlayerPlugin] { get }
    var config: PlayerConfiguration { get }
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
    
    var audioSessionType: AudioSessionService.Type { get }
}

final class ModernAVPlayerContext: NSObject, PlayerContext {
    
    // MARK: - Inputs
    
    let player: AVPlayer
    let config: PlayerConfiguration
    let nowPlaying: NowPlaying
    let audioSessionType: AudioSessionService.Type
    let plugins: [PlayerPlugin]
    
    weak var delegate: PlayerContextDelegate?
    
    // MARK: - Variables
    
    var bgToken: UIBackgroundTaskIdentifier?
    var currentItem: AVPlayerItem? {
        didSet {
            let url = (currentItem?.asset as? AVURLAsset)?.url
            delegate?.playerContext(didCurrentItemUrlChange: url)
        }
    }
    var currentTime: Double? {
        didSet { delegate?.playerContext(didCurrentTimeChange: currentTime) }
    }
    var itemDuration: Double? {
        didSet { delegate?.playerContext(didItemDurationChange: itemDuration) }
    }
    var state: PlayerState! {
        didSet { delegate?.playerContext(didStateChange: state.type) }
    }
    var debugMessage: String? {
        didSet { delegate?.playerContext(debugMessage: debugMessage) }
    }

    // MARK: - LifeCycle

    init(player: AVPlayer = AVPlayer(),
         config: PlayerConfiguration = ModernAVPlayerConfiguration(),
         nowPlaying: NowPlaying = ModernAVPlayerNowPlayingService(),
         audioSessionType: AudioSessionService.Type = ModernAVPlayerAudioSessionService.self,
         plugins: [PlayerPlugin] = []) {
        self.player = player
        self.config = config
        self.nowPlaying = nowPlaying
        self.audioSessionType = audioSessionType
        self.plugins = plugins
        super.init()

        setupLogger()
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        audioSessionType.setCategory(config.audioSessionCategory)
        state = InitState(context: self)
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    private func setupLogger() {
        LoggerInHouse.instance.levelFilter = config.loggerLevelFilter
    }
    
    func changeState(state: PlayerState) {
        self.state = state
    }
    
    // MARK: - Public functions

    func pause() {
        state.pause()
    }

    func seek(position: Double) {
        state.seek(position: position)
    }

    func stop() {
        state.stop()
    }

    func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        state.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }
    
    func play() {
        state.play()
    }
}
