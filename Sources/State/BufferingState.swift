//
//  BufferingState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public final class BufferingState: NSObject, PlayerState {
    
    public unowned var context: PlayerContext

    // MARK: - Private vars

    private var rateTimerObserver: Timer?
    private let timeOutBuffering: TimeInterval
    private let rateObserverTimeInterval: TimeInterval
    private var remainingTime: TimeInterval = 0
    private var lastPosition: Double

    // MARK: - Init

    public init(context: PlayerContext) {
        print("~~~ Buffering state")
        self.context = context
        timeOutBuffering = context.config.timeoutBuffering
        rateObserverTimeInterval = context.config.playerRateObserving
        lastPosition = context.player.currentTime().seconds
        super.init()
    }
    
    deinit {
        print("------- Deinit \(self.description)")
        rateTimerObserver?.invalidate()
    }

    // MARK: - Observations

    /*
     Get rate from timebase item is clearly more accurate than player rate
     */
    private func observingRate() {
        remainingTime = timeOutBuffering
        rateTimerObserver = Timer.scheduledTimer(withTimeInterval: rateObserverTimeInterval, repeats: true) { [unowned self] _ in
            //swiftlint:disable:next operator_usage_whitespace
            self.remainingTime -=  self.rateObserverTimeInterval
            guard let timebase = self.context.player.currentItem?.timebase else { return }

            let rate = CMTimebaseGetRate(timebase)
            print("& item rate: \(rate)")
            if rate != 0 {
                self.context.changeState(state: PlayingState(context: self.context))
            } else if self.remainingTime <= 0 {
                    //swiftlint:disable:next force_cast force_unwrapping
                    let url = (self.context.player.currentItem!.asset as! AVURLAsset).url
                    self.context.changeState(state: FailedState(context: self.context,
                                                                urlToReload: url,
                                                                shouldPlaying: true,
                                                                error: .buffering))
            } else {
                print("& remaining time: \(self.remainingTime)")
            }
        }
    }
    
    // MARK: - Player Commands

    func playCommand() {
        AudioSessionService.active { [unowned self] completed in
            if completed {
                if self.rateTimerObserver == nil { DispatchQueue.main.sync { self.observingRate() } }
                self.context.player.play()
            } else {
                //swiftlint:disable:next force_cast force_unwrapping
                let url = (self.context.player.currentItem!.asset as! AVURLAsset).url
                self.context.changeState(state: FailedState(context: self.context,
                                                            urlToReload: url,
                                                            shouldPlaying: true,
                                                            error: .activeAudioSessionFailed))
            }
        }
    }

    func seekCommand(position: Double) {
        lastPosition = position
        context.currentItem?.cancelPendingSeeks()
        let time = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
        context.player.seek(to: time) { _ in self.playCommand() }
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
        let debug = "Already trying to play"
        context.debugMessage = debug
        print("~~~ Buffering state |" + debug)
    }

    public func seek(position: Double) {
        rateTimerObserver?.invalidate()
        rateTimerObserver = nil
        seekCommand(position: position)
    }

    public func stop() {
        context.changeState(state: StoppedState(context: context))
    }
}
