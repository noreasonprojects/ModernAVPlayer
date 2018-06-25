// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ModernAVPlayer.swift
// Created by raphael ankierman on 28/05/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import AVFoundation

public protocol ModernAVPlayerDelegate: class {
    func modernAVPlayer(_ player: ModernAVPlayer, didStateChange state: ModernAVPlayer.State)
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentTimeChange currentTime: Double?)
    func modernAVPlayer(_ player: ModernAVPlayer, didItemDurationChange itemDuration: Double?)
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentItemUrlChange currentItemUrl: URL?)
    func modernAVPlayer(_ player: ModernAVPlayer, debugMessage: String?)
}

public protocol MediaPlayer {
    func loadMedia(media: PlayerMedia<PlayerMediaMetadata>, autostart: Bool)
    func pause()
    func play()
    func seek(position: Double)
    func stop()
    func updateNowPlayingInfo(metadata: PlayerMediaMetadata)
}

public final class ModernAVPlayer: NSObject, MediaPlayer {
    
    // MARK: - Output
    
    public weak var delegate: ModernAVPlayerDelegate?
    
    // MARK: - Variables
    
    private let context: ModernAVPlayerContext
    private let commandCenter: CommandCenter
    
    // MARK: - Init
    
    ///
    /// ModernAVPlayer initialisation
    ///
    /// - parameter config: setup player configuration
    /// - parameter plugins: array of plugin
    /// - parameter commandCenter: setup control center custom control
    ///
    public init(config: PlayerConfiguration = ModernAVPlayerConfiguration(),
                plugins: [PlayerPlugin] = [],
                commandCenter: CommandCenter? = nil) {
        context = ModernAVPlayerContext(player: AVPlayer(),
                                        config: config,
                                        nowPlaying: ModernAVPlayerNowPlayingService(),
                                        audioSessionType: ModernAVPlayerAudioSessionService.self,
                                        plugins: plugins)
        self.commandCenter = commandCenter ?? ModernAVPlayerCommandCenter()
        super.init()
        context.delegate = self
    }
    
    // MARK: - Actions
    
    /// Pauses playback of the current item
    public func pause() {
        context.pause()
    }
    
    ///
    /// Sets the current playback time to the specified time
    ///
    /// - parameter position: time to seek
    ///
    public func seek(position: Double) {
        context.seek(position: position)
    }
    
    /// Stops playback of the current item then seek to 0
    public func stop() {
        context.stop()
    }
    
    ///
    /// Replaces the current player media with the new media
    ///
    /// - parameter media: media to load
    /// - parameter autostart: play after media is loaded
    ///
    public func loadMedia(media: PlayerMedia<PlayerMediaMetadata>, autostart: Bool) {
        if autostart {
            commandCenter.configure(player: self)
        }
        context.loadMedia(media: media, autostart: autostart)
    }
   
    ///
    /// Replaces the current item metadata with the new metadata
    ///
    /// - parameter metadata: metadata to load
    ///
    public func updateNowPlayingInfo(metadata: PlayerMediaMetadata) {
        context.nowPlaying.update(metadata: metadata)
    }
    
    /// Begins playback of the current item
    public func play() {
        commandCenter.configure(player: self)
        context.play()
    }
}

public extension ModernAVPlayer {
    enum State: String, CustomStringConvertible {
        case buffering
        case failed
        case initialization
        case loaded
        case loading
        case paused
        case playing
        case stopped
        case waitingForNetwork
        
        public var description: String {
            switch self {
            case .waitingForNetwork:
                return "Waiting For Network"
            default:
                return rawValue.capitalized
            }
        }
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
