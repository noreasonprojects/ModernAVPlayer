//
//  ErroredState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 24/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public final class FailedState: PlayerState {

    // MARK: - Input

    public unowned var context: PlayerContext

    // MARK: - Init
    
    public init(context: PlayerContext, error: CustomError) {
        LoggerInHouse.instance.log(message: "Init reason:\(error.localizedDescription)", event: .debug)
        self.context = context
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
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
        let debug = "Unable to play, reload a media first"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: "Unable to play, reload a media first", event: .warning)
    }

    public func seek(position: Double) {
        let debug = "Unable to seek, load a media first"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: "Unable to seek, load a media first", event: .warning)
    }

    public func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
