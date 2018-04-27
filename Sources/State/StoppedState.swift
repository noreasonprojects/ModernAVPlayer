//
//  StoppedState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public struct StoppedState: PlayerState {

    // MARK: - Vars

    public unowned var context: PlayerContext

    // MARK: - Init

    public init(context: PlayerContext) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        
        self.context = context
        self.context.player.pause()
        self.context.player.seek(to: kCMTimeZero)
        self.context.currentTime = 0
    }

    // MARK: - Shared actions

    public func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        context.changeState(state: state)
    }

    public func pause() {
        context.changeState(state: PausedState(context: context))
    }

    public func play() {
        if context.player.currentItem?.status == .readyToPlay {
            let state = BufferingState(context: context)
            context.changeState(state: state)
            state.playCommand()
        } else {
            let debug = "Please load item before playing"
            context.debugMessage = debug
            LoggerInHouse.instance.log(message: debug, event: .warning)
        }
    }

    public func seek(position: Double) {
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { [context] completed in
            if completed { context.currentTime = position }
        }
    }

    public func stop() {
        let debug = "Already stopped"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }
}
