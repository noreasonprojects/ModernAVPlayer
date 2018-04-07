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
    private let reachability: ReachabilityService
    
    // MARK: - Init
    
    public init(context: PlayerContext, urlToReload: URL, shouldPlaying: Bool, error: CustomError) {
        print("~~~ Failed state: \(error.localizedDescription)")
        self.context = context
        self.urlToReload = urlToReload
        self.reachability = ReachabilityService(url: context.config.urlNetworkTesting,
                                                timeoutURLSession: context.config.timeoutURLSession,
                                                tiNetworkTesting: context.config.tiNetworkTesting,
                                                networkIteration: context.config.networkIteration)
        setIsReachableCallBack(shouldPlaying: shouldPlaying)
        reachability.start()
    }

    deinit {
        print("------- Deinit \(self.description)")
    }
    
    // MARK: - Reachability

    private func setIsReachableCallBack(shouldPlaying: Bool) {
        reachability.isReachable = { [unowned self] isReachable in
            print("### Network | seem to be \(isReachable)")
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
        print("~~~ Failed state |" + debug)
    }

    public func seek(position: Double) {
        let debug = "Unable to seek, load a media first"
        context.debugMessage = debug
        print("~~~ Failed state |" + debug)
    }

    public func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
