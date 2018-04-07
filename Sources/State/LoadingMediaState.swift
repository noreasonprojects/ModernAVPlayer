//
//  LoadingMediaState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import UIKit

public final class LoadingMediaState: PlayerState {
    
    // MARK: - Var
    
    public unowned let context: PlayerContext
    
    // MARK: - Private vars
    
    private let shouldPlaying: Bool
    private let media: PlayerMedia?
    private let url: URL?
    private let lastKnownPosition: CMTime?
    private var itemStatusObserving: ItemStatusObservingService?

    // MARK: - Init
    
    public init(context: PlayerContext, itemUrl: URL, shouldPlaying: Bool, lastPosition: CMTime?) {
        print("~~~ LoadingMedia state")
        self.context = context
        self.shouldPlaying = shouldPlaying
        self.media = nil
        self.url = itemUrl
        self.lastKnownPosition = lastPosition

        startBgTask(context: context)
        createReplaceItem(url: itemUrl)
    }

    public init(context: PlayerContext, media: PlayerMedia, shouldPlaying: Bool) {
        print("~~~ LoadingMedia state")
        self.context = context
        self.shouldPlaying = shouldPlaying
        self.media = media
        self.url = nil
        self.lastKnownPosition = nil

        startBgTask(context: context)
        createReplaceItem(url: media.url)
    }

    deinit {
        print("------- Deinit \(self.description)")
    }

    // MARK: - Shared actions

    public func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        createReplaceItem(url: media.url)
    }

    public func pause() {
        cancelMediaLoading()
        context.changeState(state: PausedState(context: context))
    }

    public func play() {
        let debug = "Please wait to be loaded"
        context.debugMessage = debug
        print("~~~ LoadingMedia state |" + debug)
    }

    public func seek(position: Double) {
        let debug = "Unable to seek, wait the media to be loaded"
        context.debugMessage = debug
        print("~~~ LoadingMedia state |" + debug)
    }

    public func stop() {
        cancelMediaLoading()
        context.changeState(state: StoppedState(context: context))
    }

    // MARK: - Private actions
    
    private func cancelMediaLoading() {
        context.player.currentItem?.asset.cancelLoading()
        context.player.currentItem?.cancelPendingSeeks()
        context.currentItem = nil
        context.player.replaceCurrentItem(with: nil)
    }
    
    private func createItem(with url: URL) -> AVPlayerItem {
        let asset = AVAsset(url: url)
        return AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: ["playable"])
    }

    private func createReplaceItem(url: URL) {
        let item = createItem(with: url)
        startObservingItemStatus(item: item)
        context.currentItem = item
        /*
         Loading clip media from playing state, play automatically the new clip media
         Ensure player will play only when we ask
         */
        context.player.pause()
        context.player.replaceCurrentItem(with: item)
    }
    
    private func startObservingItemStatus(item: AVPlayerItem) {
        itemStatusObserving = ItemStatusObservingService(item: item)
        guard let iso = itemStatusObserving else { assertionFailure(); return }
        
        iso.itemStatusCallback = { [unowned self] status in
            self.moveToNextState(with: status)
        }
    }

    private func startBgTask(context: PlayerContext) {
        context.bgToken = UIApplication.shared.beginBackgroundTask { [context] in
            if let token = context.bgToken { UIApplication.shared.endBackgroundTask(token) }
            context.bgToken = nil
        }
        print("∆∆∆ startBgTask create: \(String(describing: context.bgToken))")
    }

    private func moveToNextState(with status: AVPlayerItemStatus) {
        switch status {
        case .unknown:
            assertionFailure()
        case .failed:
            guard let url = media?.url ?? url else { assertionFailure(); return }
            context.changeState(state: FailedState(context: context,
                                                   urlToReload: url,
                                                   shouldPlaying: shouldPlaying,
                                                   error: .itemFailedWhenLoading))
        case .readyToPlay:
            context.itemDuration = context.player.currentItem?.duration.seconds
            guard let position = lastKnownPosition else { moveToLoadedState(); return }
            context.player.seek(to: position) { completed in
                guard completed else { return }
                self.moveToLoadedState()
            }
        }
    }

    private func moveToLoadedState() {
        let state: PlayerState
        if let media = self.media {
            state = LoadedState(context: self.context, media: media)
        } else {
            state = LoadedState(context: self.context)
        }
        self.context.changeState(state: state)
        if self.shouldPlaying { state.play() }
    }
}
