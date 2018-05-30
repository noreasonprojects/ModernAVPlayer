//
//  BufferingState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

final class BufferingState: NSObject, PlayerState {
    
    // MARK: - Inputs
    
    unowned var context: PlayerContext
    private var rateObservingService: RateObservingService
    
    // MARK: - Variable

    var type: ModernAVPlayer.State = .buffering

    // MARK: - Init

    init(context: PlayerContext, observingRateService: RateObservingService? = nil) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        
        guard let item = context.player.currentItem else { fatalError("item should exist") }
        self.rateObservingService = observingRateService ?? ModernAVPlayerRateObservingService(config: context.config, item: item)

        self.rateObservingService.onTimeout = { [context] in
            guard let url = (context.player.currentItem?.asset as? AVURLAsset)?.url
                else { return }
            
            let waitingState = WaitingNetworkState(context: context,
                                                   urlToReload: url,
                                                   shouldPlaying: true,
                                                   error: .buffering)
            context.changeState(state: waitingState)
        }

        self.rateObservingService.onPlaying = { [context] in
            context.changeState(state: PlayingState(context: context))
        }
        
        super.init()
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    // MARK: - Player Commands

    func playCommand() {
        rateObservingService.start()
        context.player.play()
    }

    func seekCommand(position: Double) {
        context.currentItem?.cancelPendingSeeks()
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { _ in self.playCommand() }
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
        let debug = "Already trying to play"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: "Already trying to play", event: .warning)
    }

    func seek(position: Double) {
        seekCommand(position: position)
    }

    func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
