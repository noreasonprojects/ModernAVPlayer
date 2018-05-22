//
//  InitState.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public struct InitState: PlayerState {

    // MARK: - Vars

    public unowned var context: PlayerContext

    // MARK: - Init

    public init(context: PlayerContext) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        
        if #available(iOS 10, *) {
            context.player.automaticallyWaitsToMinimizeStalling = false
        }
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
        let debug = "Load item before playing"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }
    
    public func seek(position: Double) {
        let debug = "Unable to seek, load a media first"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }
    
    public func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
