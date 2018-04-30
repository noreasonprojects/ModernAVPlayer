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

public final class PlayingState: PlayerState {
    public unowned var context: PlayerContext
    private var timerObserver: Any?
    private var itemPlaybackObservingService: ItemPlaybackObservingServiceProtocol
    
    // MARK: - Lifecycle

    public init(context: PlayerContext,
                itemPlaybackObservingService: ItemPlaybackObservingServiceProtocol = ItemPlaybackObservingService()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.itemPlaybackObservingService = itemPlaybackObservingService
        stopBgTask(context: context)
        setTimerObserver()
        
        self.itemPlaybackObservingService.onPlaybackStalled = { [weak self] in self?.playbackStalled() }
        self.itemPlaybackObservingService.onPlayToEndTime = { [weak self] in self?.playToEndTime() }
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

    public func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        let state = LoadingMediaState(context: context, media: media, shouldPlaying: shouldPlaying)
        context.changeState(state: state)
    }

    public func pause() {
        context.changeState(state: PausedState(context: context))
    }

    public func play() {
        let debug = "Already playing"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }

    public func seek(position: Double) {
        let state = BufferingState(context: context)
        context.changeState(state: state)
        state.seekCommand(position: position)
    }

    public func stop() {
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
        context.changeState(state: FailedState(context: context,
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
}
