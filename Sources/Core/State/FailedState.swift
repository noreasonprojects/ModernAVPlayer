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

    // MARK: - Vars

    public unowned var context: PlayerContext

    // MARK: - Private vars

    private let urlToReload: URL
    private var reachability: ReachabilityServiceProtocol
    
    // MARK: - Init
    
    public init(context: PlayerContext,
                urlToReload: URL,
                shouldPlaying: Bool,
                error: CustomError,
                reachabilityService: ReachabilityServiceProtocol? = nil) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.urlToReload = urlToReload
        self.reachability = reachabilityService ?? ReachabilityService(config: context.config)
        setIsReachableCallBack(shouldPlaying: shouldPlaying)
        reachability.start()
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    // MARK: - Reachability

    private func setIsReachableCallBack(shouldPlaying: Bool) {
        reachability.isReachable = { [unowned self] isReachable in
            LoggerInHouse.instance.log(message: "Network | seem to be \(isReachable)", event: .info)
            guard isReachable else { return }

            let lastKnownPosition = self.isDurationItemFinite() ? self.context.player.currentTime() : nil
            let state = LoadingMediaState(context: self.context,
                                          itemUrl: self.urlToReload,
                                          shouldPlaying: shouldPlaying,
                                          lastPosition: lastKnownPosition)
            self.context.changeState(state: state)
        }
    }

    private func isDurationItemFinite() -> Bool {
        return context.itemDuration?.isFinite ?? false
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
