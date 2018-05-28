//
//  ModernAVPlayer.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 28/05/2018.
//

import AVFoundation

public protocol ModernAVPlayerDelegate: class {
    func modernAVPlayer(state: ModernAVPlayer.State)
    func modernAVPlayer(currentTime: Double?)
    func modernAVPlayer(itemDuration: Double?)
    func modernAVPlayer(debugMessage: String?)
    func modernAVPlayer(currentItemUrl: URL?)
}

public final class ModernAVPlayer {
    
    // MARK: - Outputs
    
    public enum State: String {
        case buffering
        case failed
        case initialization
        case loaded
        case loading
        case paused
        case playing
        case stopped
        case waitingNetwork
        
        public var description: String { return rawValue.capitalized }
    }
    
    public weak var delegate: ModernAVPlayerDelegate? {
        didSet { context.delegate = delegate }
    }
    
    // MARK: - Variable
    
    private let context: ConcretePlayerContext
    
    // MARK: - Init
    
    public init(player: AVPlayer = AVPlayer(),
                config: ContextConfiguration = ModernAVPlayerConfig(),
                nowPlaying: NowPlaying = NowPlayingService(),
                audioSessionType: AudioSession.Type = AudioSessionService.self) {
        
        context = ConcretePlayerContext(player: player,
                                        config: config,
                                        nowPlaying: nowPlaying,
                                        audioSessionType: audioSessionType)
    }
    
    // MARK: - Actions
    
    public func pause() {
        context.pause()
    }
    
    public func seek(position: Double) {
        context.seek(position: position)
    }
    
    public func stop() {
        context.stop()
    }
    
    public func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        context.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }
    
    public func play() {
        context.play()
    }
}
