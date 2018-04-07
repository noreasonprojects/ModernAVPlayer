//
//  PausedState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public struct PausedState: PlayerState {
    public unowned var context: PlayerContext

    // MARK: Init
    
    public init(context: PlayerContext) {
        print("~~~ Paused state")
        self.context = context
        self.context.player.pause()
    }
    
    // MARK: - Shared actions

    public func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        context.changeState(state: state)
    }

    public func pause() {
        let debug = "Already paused"
        context.debugMessage = debug
        print("~~~ Paused state |" + debug)
    }

    public func play() {
        if context.player.currentItem?.status == .readyToPlay {
            let state = BufferingState(context: context)
            context.changeState(state: state)
            state.playCommand()
        } else {
            let debug = "Please load item before playing"
            context.debugMessage = debug
            print("~~~ Paused state |" + debug)
        }
    }

    public func seek(position: Double) {
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { [context] completed in
            if completed { context.currentTime = position }
        }
    }

    public func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
