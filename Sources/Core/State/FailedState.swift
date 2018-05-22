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
        sendDebugMessage("Unable to pause, load a media first")
    }

    public func play() {
        sendDebugMessage("Unable to play, load a media first")
    }

    public func seek(position: Double) {
        sendDebugMessage("Unable to seek, load a media first")
    }

    public func stop() {
        sendDebugMessage("Unable to stop, load a media first")
    }
    
    private func sendDebugMessage(_ debugMessage: String) {
        context.debugMessage = debugMessage
        LoggerInHouse.instance.log(message: debugMessage, event: .warning)
    }
}
