//
//  PlayingState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation
import MediaPlayer

final class PlayingState: PlayerState {
    
    // MARK: - Input
    
    unowned var context: PlayerContext
    
    // MARK: - Variables
    
    var type: ModernAVPlayer.State = .playing
    private var timerObserver: Any?
    private var itemPlaybackObservingService: ItemPlaybackObservingServiceProtocol
    private var routeAudioService: RouteAudioService
    private var interruptionAudioService: InterruptionAudioService
    
    // MARK: - Lifecycle

    init(context: PlayerContext,
         itemPlaybackObservingService: ItemPlaybackObservingServiceProtocol = ItemPlaybackObservingService(),
         routeAudioService: RouteAudioService = RouteAudioService(),
         interruptionAudioService: InterruptionAudioService = InterruptionAudioService()) {
        
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.itemPlaybackObservingService = itemPlaybackObservingService
        self.routeAudioService = routeAudioService
        self.interruptionAudioService = interruptionAudioService
        stopBgTask(context: context)
        setTimerObserver()
        
        self.itemPlaybackObservingService.onPlaybackStalled = { [weak self] in self?.playbackStalled() }
        self.itemPlaybackObservingService.onPlayToEndTime = { [weak self] in self?.playToEndTime() }
        self.routeAudioService.onRouteChanged = { [weak self] in self?.routeAudioChanged(reason: $0) }
        setupInterruptionCallback()
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        if let to = timerObserver { context.player.removeTimeObserver(to) }
    }

    // MARK: - Background task

    private func startBgTask(context: PlayerContext) {
        context.bgToken = UIApplication.shared.beginBackgroundTask { [context] in
            if let token = context.bgToken {
                UIApplication.shared.endBackgroundTask(token)
            }
            context.bgToken = nil
        }
        LoggerInHouse.instance.log(message: "StartBgTask create: \(String(describing: context.bgToken))", event: .info)
    }

    private func stopBgTask(context: PlayerContext) {
        guard let token = context.bgToken else { return }

        LoggerInHouse.instance.log(message: "StopBgTask: \(token)", event: .info)
        UIApplication.shared.endBackgroundTask(token)
        context.bgToken = nil
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
        let debug = "Already playing"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }

    func seek(position: Double) {
        let state = BufferingState(context: context)
        context.changeState(state: state)
        state.seekCommand(position: position)
    }

    func stop() {
        context.changeState(state: StoppedState(context: context))
    }

    // MARK: - Private actions

    private func setTimerObserver() {
        timerObserver = context.player.addPeriodicTimeObserver(forInterval: context.config.periodicPlayingTime,
                                                               queue: nil) { [context] time in
            context.currentTime = time.seconds
            context.nowPlaying.overrideInfoCenter(for: MPNowPlayingInfoPropertyElapsedPlaybackTime,
                                                  value: time.seconds)
        }
    }
    
    private func playbackStalled() {
        guard let url = (context.player.currentItem?.asset as? AVURLAsset)?.url
            else { assertionFailure(); return }

        startBgTask(context: context)
        context.changeState(state: WaitingNetworkState(context: context,
                                                       urlToReload: url,
                                                       shouldPlaying: true,
                                                       error: .itemPlaybackStalled))
    }
    
    private func playToEndTime() {
        guard let duration = context.itemDuration
            else { assertionFailure(); return }
        
        let roundedCurrentTime = context.player.currentTime().seconds.rounded(.up)
        guard roundedCurrentTime >= duration
            else { self.playbackStalled(); return }
        context.changeState(state: StoppedState(context: context))
    }
    
    private func routeAudioChanged(reason: AVAudioSessionRouteChangeReason) {
        switch reason {
        case .oldDeviceUnavailable, .categoryChange, .unknown:
            context.changeState(state: PausedState(context: context))
        case .newDeviceAvailable, .wakeFromSleep, .override, .noSuitableRouteForCategory, .routeConfigurationChange:
            break
        }
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pause() }
    }
}
