//
//  ModernAVPlayer.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 28/05/2018.
//

import AVFoundation

public protocol ModernAVPlayerDelegate: class {
    func modernAVPlayer(_ player: ModernAVPlayer, didStateChange state: ModernAVPlayer.State)
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentTimeChange currentTime: Double?)
    func modernAVPlayer(_ player: ModernAVPlayer, didItemDurationChange itemDuration: Double?)
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentItemUrlChange currentItemUrl: URL?)
    func modernAVPlayer(_ player: ModernAVPlayer, debugMessage: String?)
}

protocol ModernAVPlayerProtocol {
    func loadMedia(media: PlayerMediaProtocol, shouldPlaying: Bool)
    func pause()
    func play()
    func seek(position: Double)
    func stop()
    
    var delegate: ModernAVPlayerDelegate? { get set }
}

public final class ModernAVPlayer: ModernAVPlayerProtocol {
    
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
    
    public weak var delegate: ModernAVPlayerDelegate?
    
    // MARK: - Variable
    
    private let context: PlayerContext
    
    // MARK: - Init
    
    public init(player: AVPlayer = AVPlayer(),
                config: ContextConfiguration = ModernAVPlayerConfig(),
                nowPlaying: NowPlaying = NowPlayingService(),
                audioSessionType: AudioSession.Type = AudioSessionService.self) {
        
        context = PlayerContext(player: player,
                                config: config,
                                nowPlaying: nowPlaying,
                                audioSessionType: audioSessionType)
        context.delegate = self
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
    
    public func loadMedia(media: PlayerMediaProtocol, shouldPlaying: Bool) {
        context.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }
    
    public func play() {
        context.play()
    }
}

extension ModernAVPlayer: PlayerContextDelegate {
    func playerContext(didStateChange state: ModernAVPlayer.State) {
        delegate?.modernAVPlayer(self, didStateChange: state)
    }
    
    func playerContext(didCurrentTimeChange currentTime: Double?) {
        delegate?.modernAVPlayer(self, didCurrentTimeChange: currentTime)
    }
    
    func playerContext(didItemDurationChange itemDuration: Double?) {
        delegate?.modernAVPlayer(self, didItemDurationChange: itemDuration)
    }
    
    func playerContext(didCurrentItemUrlChange currentItemUrl: URL?) {
        delegate?.modernAVPlayer(self, didCurrentItemUrlChange: currentItemUrl)
    }
    
    func playerContext(debugMessage: String?) {
        delegate?.modernAVPlayer(self, debugMessage: debugMessage)
    }
}
