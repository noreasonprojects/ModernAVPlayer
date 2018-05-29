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

protocol PlayerContextProtocol: class {
    var player: AVPlayer { get }
    var config: ContextConfiguration { get }
    var currentItem: AVPlayerItem? { get set }
    var currentTime: Double? { get set }
    var itemDuration: Double? { get set }
    var state: PlayerStateProtocol! { get }
    var debugMessage: String? { get set }
    var nowPlaying: NowPlaying { get }
    var bgToken: UIBackgroundTaskIdentifier? { get set }
    
    func pause()
    func play()
    func seek(position: Double)
    func stop()
    func loadMedia(media: PlayerMediaProtocol, shouldPlaying: Bool)
    func changeState(state: PlayerStateProtocol)
    
    var audioSessionType: AudioSession.Type { get }
}

final class PlayerContext: NSObject, PlayerContextProtocol {
    
    // MARK: - Inputs
    
    let player: AVPlayer
    let config: ContextConfiguration
    let nowPlaying: NowPlaying
    let audioSessionType: AudioSession.Type
    
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
    var state: PlayerStateProtocol! {
        didSet { delegate?.playerContext(didStateChange: state.type) }
    }
    var debugMessage: String? {
        didSet { delegate?.playerContext(debugMessage: debugMessage) }
    }

    // MARK: - LifeCycle

    init(player: AVPlayer = AVPlayer(),
         config: ContextConfiguration = ModernAVPlayerConfig(),
         nowPlaying: NowPlaying = NowPlayingService(),
         audioSessionType: AudioSession.Type = AudioSessionService.self) {
        self.player = player
        self.config = config
        self.nowPlaying = nowPlaying
        self.audioSessionType = audioSessionType
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
    
    func changeState(state: PlayerStateProtocol) {
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

    func loadMedia(media: PlayerMediaProtocol, shouldPlaying: Bool) {
        state.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }
    
    func play() {
        state.play()
    }
}
