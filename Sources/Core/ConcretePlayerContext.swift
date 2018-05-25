//
//  PlayerContext.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 21/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import UIKit

public protocol PlayerContextDelegate: class {
    func playerContext(_ context: ConcretePlayerContext, state: ModernAVPlayerState)
    func playerContext(_ context: ConcretePlayerContext, currentTime: Double?)
    func playerContext(_ context: ConcretePlayerContext, itemDuration: Double?)
    func playerContext(_ context: ConcretePlayerContext, debugMessage: String?)
    func playerContext(_ context: ConcretePlayerContext, currentItemUrl: URL?)
}

public final class ConcretePlayerContext: NSObject, PlayerContext {
    
    // MARK: - Output

    public weak var delegate: PlayerContextDelegate?

    // MARK: - Inputs
    
    let player: AVPlayer
    let config: ContextConfiguration
    let nowPlaying: NowPlaying
    let audioSessionType: AudioSession.Type
    
    // MARK: - Variables
    
    var bgToken: UIBackgroundTaskIdentifier?
    var currentItem: AVPlayerItem? {
        didSet {
            let url = (currentItem?.asset as? AVURLAsset)?.url
            delegate?.playerContext(self, currentItemUrl: url)
        }
    }
    var currentTime: Double? {
        didSet { delegate?.playerContext(self, currentTime: currentTime) }
    }
    var itemDuration: Double? {
        didSet { delegate?.playerContext(self, itemDuration: itemDuration) }
    }
    var state: PlayerState! {
        didSet { delegate?.playerContext(self, state: state.type) }
    }
    var debugMessage: String? {
        didSet { delegate?.playerContext(self, debugMessage: debugMessage) }
    }

    // MARK: - LifeCycle

    public init(player: AVPlayer = AVPlayer(),
                config: ContextConfiguration = PlayerContextConfiguration(),
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
    
    func changeState(state: PlayerState) {
        self.state = state
    }
    
    // MARK: - Public functions

    public func pause() {
        state.pause()
    }

    public func seek(position: Double) {
        state.seek(position: position)
    }

    public func stop() {
        state.stop()
    }

    public func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        state.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }
    
    public func play() {
        state.play()
    }
}
