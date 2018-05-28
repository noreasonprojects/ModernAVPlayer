//
//  ErroredState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 24/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

final class FailedState: PlayerState {

    // MARK: - Input

    unowned var context: PlayerContext
    
    // MARK: - Variable
    
    var type: ModernAVPlayer.State = .failed
    
    // MARK: - Init
    
    init(context: PlayerContext, error: CustomError) {
        LoggerInHouse.instance.log(message: "Init reason:\(error.localizedDescription)", event: .debug)
        self.context = context
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }

    // MARK: - Shared actions

    func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        context.changeState(state: state)
    }

    func pause() {
        sendDebugMessage("Unable to pause, load a media first")
    }

    func play() {
        sendDebugMessage("Unable to play, load a media first")
    }

    func seek(position: Double) {
        sendDebugMessage("Unable to seek, load a media first")
    }

    func stop() {
        sendDebugMessage("Unable to stop, load a media first")
    }
    
    private func sendDebugMessage(_ debugMessage: String) {
        context.debugMessage = debugMessage
        LoggerInHouse.instance.log(message: debugMessage, event: .warning)
    }
}
