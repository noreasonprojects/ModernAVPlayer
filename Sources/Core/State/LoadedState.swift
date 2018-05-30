//
//  LoadedState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import MediaPlayer

struct LoadedState: PlayerState {

    // MARK: - Input

    unowned var context: PlayerContext
    
    // MARK: - Variable
    
    var type: ModernAVPlayer.State = .loaded

    // MARK: - Init

    init(context: PlayerContext, media: PlayerMedia? = nil) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.context.currentTime = 0
        
        guard let media = media else { return }
        
        if #available(iOS 9.1, *) {
            updateRemoteCommandCenter(mediaType: media.type)
        }
        context.nowPlaying.update(media: media, duration: context.player.currentItem?.duration.seconds)
        context.plugins.forEach { $0.didLoadMedia(media) }
    }

    // MARK: - Command Center

    @available(iOS 9.1, *)
    private func updateRemoteCommandCenter(mediaType: MediaType) {
        let remote = MPRemoteCommandCenter.shared()
        remote.changePlaybackPositionCommand.isEnabled = mediaType == .clip
    }

    // MARK: - Shared actions
    
    func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        context.changeState(state: state)
    }

    func pause() {
        context.changeState(state: PausedState(context: context))
    }

    func play() {
        let state = BufferingState(context: context)
        context.changeState(state: state)
        state.playCommand()
    }

    func seek(position: Double) {
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { [context] completed in
            if completed { context.currentTime = position }
        }
    }

    func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
