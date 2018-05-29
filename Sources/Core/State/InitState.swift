//
//  InitState.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

struct InitState: PlayerState {

    // MARK: - Input

    unowned var context: PlayerContext
    
    // MARK: - Variable
    
    var type: ModernAVPlayer.State = .initialization
    
    // MARK: - Init

    init(context: PlayerContext) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        
        if #available(iOS 10, *) {
            context.player.automaticallyWaitsToMinimizeStalling = false
        }
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
        let debug = "Load item before playing"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }
    
    func seek(position: Double) {
        let debug = "Unable to seek, load a media first"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }
    
    func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
