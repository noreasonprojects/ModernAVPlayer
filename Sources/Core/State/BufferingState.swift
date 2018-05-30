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
    private var interruptionAudioService: ModernAVPlayerInterruptionAudioService
    
    // MARK: - Variable

    var type: ModernAVPlayer.State = .buffering

    // MARK: - Init

    init(context: PlayerContext,
         rateObservingService: RateObservingService? = nil,
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        
        guard let item = context.player.currentItem else { fatalError("item should exist") }
        
        self.context = context
        self.rateObservingService = rateObservingService ?? ModernAVPlayerRateObservingService(config: context.config, item: item)
        self.interruptionAudioService = interruptionAudioService
        
        super.init()
        setupRateObservingCallback()
        setupInterruptionCallback()
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    // MARK: - Setup
    
    private func setupRateObservingCallback() {
        rateObservingService.onTimeout = { [context] in
            guard let url = (context.player.currentItem?.asset as? AVURLAsset)?.url
                else { return }
            
            let waitingState = WaitingNetworkState(context: context,
                                                   urlToReload: url,
                                                   shouldPlaying: true,
                                                   error: .buffering)
            context.changeState(state: waitingState)
        }
        
        rateObservingService.onPlaying = { [context] in
            context.changeState(state: PlayingState(context: context))
        }
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pause() }
    }
    
    // MARK: - Player Commands

    func playCommand() {
        rateObservingService.start()
        context.player.play()
    }

    func seekCommand(position: Double) {
        context.player.currentItem?.cancelPendingSeeks()
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { _ in self.playCommand() }
    }

    // MARK: - Shared actions

    func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        changeState(state)
    }

    func pause() {
        changeState(PausedState(context: context))
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
        changeState(StoppedState(context: context))
    }
    
    // MARK: - Private
    
    private func changeState(_ state: PlayerState) {
        rateObservingService.stop(clearCallbacks: true)
        context.player.currentItem?.cancelPendingSeeks()
        context.changeState(state: state)
    }
}
