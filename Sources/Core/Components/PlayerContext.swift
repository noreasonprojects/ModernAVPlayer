// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayerContext.swift
// Created by raphael ankierman on 21/02/2018.
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
    func loadMedia(media: PlayerMedia<PlayerMediaMetadata>, autostart: Bool)
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

    func loadMedia(media: PlayerMedia<PlayerMediaMetadata>, autostart: Bool) {
        state.loadMedia(media: media, autostart: autostart)
    }
    
    func play() {
        state.play()
    }
}
