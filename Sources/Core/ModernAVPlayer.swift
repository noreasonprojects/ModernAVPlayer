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
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentMediaChange media: PlayerMedia?)
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentTimeChange currentTime: Double)
    func modernAVPlayer(_ player: ModernAVPlayer, didItemDurationChange itemDuration: Double?)
    func modernAVPlayer(_ player: ModernAVPlayer, debugMessage: String?)
    func modernAVPlayer(_ player: ModernAVPlayer, didItemPlayToEndTime endTime: Double)
}

public final class ModernAVPlayer: NSObject, ModernAVPlayerExposable {

    // MARK: - Outputs

    public weak var delegate: ModernAVPlayerDelegate?

    /// AVPlayer in use
    public var player: AVPlayer {
        return context.player
    }

    /// Current player state
    public var state: ModernAVPlayer.State {
        return context.state.type
    }
    
    /// Last media requested to be load
    public var currentMedia: PlayerMedia? {
        return context.currentMedia
    }

    /// Player's current time
    public var currentTime: Double {
        return context.currentTime
    }

    /// Enable/Disable loop on the current media
    public var loopMode: Bool {
        get { return context.loopMode }
        set { context.loopMode = newValue }
    }

    /// Remote command preset
    public var remoteCommands: [ModernAVPlayerRemoteCommand]? {
        get { return context.remoteCommands }
        set { context.remoteCommands = newValue }
    }

    // MARK: - Input
    
    private let context: ModernAVPlayerContext
    
    // MARK: - Init
    
    ///
    /// ModernAVPlayer initialisation
    ///
    /// - parameter player: AVPlayer instance in use
    /// - parameter config: setup player configuration
    /// - parameter plugins: plugin in use
    /// - parameter loggerDomains: enable logger domains
    ///
    public init(player: AVPlayer = AVPlayer(),
                config: PlayerConfiguration = ModernAVPlayerConfiguration(),
                plugins: [PlayerPlugin] = [],
                loggerDomains: [ModernAVPlayerLoggerDomain] = []) {
        ModernAVPlayerLogger.setup.domains = loggerDomains
        context = ModernAVPlayerContext(player: player, config: config, plugins: plugins)
        super.init()
        context.delegate = self
        
        defer {
            if config.useDefaultRemoteCommand {
                remoteCommands = ModernAVPlayerRemoteCommandFactory(player: self).defaultCommands
            }
        }
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
    /// - parameter position: seek position
    ///
    public func load(media: PlayerMedia, autostart: Bool, position: Double? = nil) {
        context.load(media: media, autostart: autostart, position: position)
    }

    ///
    /// Replaces the current item metadata and updates now playing info
    ///
    /// - parameter metadata: metadata to load
    ///
    public func updateMetadata(_ metadata: PlayerMediaMetadata) {
        context.updateMetadata(metadata)
    }
    
    /// Begins playback of the current item
    public func play() {
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
    
    func playerContext(didCurrentMediaChange media: PlayerMedia?) {
        delegate?.modernAVPlayer(self, didCurrentMediaChange: media)
    }
    
    func playerContext(didCurrentTimeChange currentTime: Double) {
        delegate?.modernAVPlayer(self, didCurrentTimeChange: currentTime)
    }
    
    func playerContext(didItemDurationChange itemDuration: Double?) {
        delegate?.modernAVPlayer(self, didItemDurationChange: itemDuration)
    }
    
    func playerContext(debugMessage: String?) {
        delegate?.modernAVPlayer(self, debugMessage: debugMessage)
    }
    
    func playerContext(didItemPlayToEndTime endTime: Double) {
        delegate?.modernAVPlayer(self, didItemPlayToEndTime: endTime)
    }
}
