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

    // MARK: - Init

    public init(context: PlayerContext) {
        print("~~~ Playing state")
        self.context = context
        stopBgTask(context: context)
        setTimerObserver()
        observeItemNotifications()
    }

    deinit {
        print("------- Deinit \(self.description)")
        if let to = timerObserver { context.player.removeTimeObserver(to) }
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemPlaybackStalled,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime,
                                                  object: nil)
    }

    // MARK: - Background task

    private func startBgTask(context: PlayerContext) {
        context.bgToken = UIApplication.shared.beginBackgroundTask { [context] in
            if let token = context.bgToken {
                UIApplication.shared.endBackgroundTask(token)
            }
            context.bgToken = nil
        }
        print("∆∆∆ startBgTask create: \(String(describing: context.bgToken))")
    }

    private func stopBgTask(context: PlayerContext) {
        guard let token = context.bgToken else { return }

        print("∆∆∆ stopBgTask: \(token)")
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
        print("~~~ Playing state |" + debug)
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
                                                               queue: nil) { [unowned self] time in
            self.context.currentTime = time.seconds
            self.context.nowPlaying.overrideInfoCenter(for: MPNowPlayingInfoPropertyElapsedPlaybackTime,
                                                       value: time.seconds)
        }
    }

    private func observeItemNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(PlayingState.itemPlaybackStalled),
                                               name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PlayingState.itemPlayToEndTime),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PlayingState.itemFailedToPlayToEndTime),
                                               name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime, object: nil)
    }

    @objc
    private func itemPlaybackStalled() {
        guard
            let url = (context.player.currentItem?.asset as? AVURLAsset)?.url
            else { assertionFailure(); return }

        startBgTask(context: context)
        context.changeState(state: FailedState(context: context,
                                               urlToReload: url,
                                               shouldPlaying: true,
                                               error: .itemPlaybackStalled))
    }

    @objc
    private func itemPlayToEndTime() {
        guard let duration = context.itemDuration
            else { assertionFailure(); return }

        let roundedCurrentTime = context.player.currentTime().seconds.rounded(.up)
        guard roundedCurrentTime >= duration
            else { itemPlaybackStalled(); return }

        context.changeState(state: StoppedState(context: context))
    }

    @objc
    private func itemFailedToPlayToEndTime() {
        print("¬¬¬ AVPlayerItemFailedToPlayToEndTime called")
    }
}
