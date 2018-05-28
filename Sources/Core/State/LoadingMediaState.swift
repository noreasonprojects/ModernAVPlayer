//
//  LoadingMediaState.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 23/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

final class LoadingMediaState: PlayerState {
    
    // MARK: - Input
    
    unowned let context: PlayerContext
    
    // MARK: - Variables
    
    var type: ModernAVPlayer.State = .loading
    private let shouldPlaying: Bool
    private let media: PlayerMedia?
    private let url: URL?
    private let lastKnownPosition: CMTime?
    private var itemStatusObserving: ItemStatusObservingService?
    private var interruptionAudioService: InterruptionAudioService

    // MARK: - Init
    
    init(context: PlayerContext,
         itemUrl: URL,
         shouldPlaying: Bool,
         lastPosition: CMTime?,
         interruptionAudioService: InterruptionAudioService = InterruptionAudioService()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.shouldPlaying = shouldPlaying
        self.media = nil
        self.url = itemUrl
        self.lastKnownPosition = lastPosition
        self.interruptionAudioService = interruptionAudioService

        context.audioSessionType.activate()
        
        setupInterruptionCallback()
        startBgTask(context: context)
        createReplaceItem(url: itemUrl)
    }

    init(context: PlayerContext,
         media: PlayerMedia,
         shouldPlaying: Bool,
         interruptionAudioService: InterruptionAudioService = InterruptionAudioService()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.context = context
        self.shouldPlaying = shouldPlaying
        self.media = media
        self.url = nil
        self.lastKnownPosition = nil
        self.interruptionAudioService = interruptionAudioService
        
        context.audioSessionType.activate()
        
        setupInterruptionCallback()
        startBgTask(context: context)
        createReplaceItem(url: media.url)
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pause() }
    }

    // MARK: - Shared actions

    func loadMedia(media: PlayerMedia, shouldPlaying: Bool) {
        createReplaceItem(url: media.url)
    }

    func pause() {
        cancelMediaLoading()
        context.changeState(state: PausedState(context: context))
    }

    func play() {
        let debug = "Please wait to be loaded"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }

    func seek(position: Double) {
        let debug = "Unable to seek, wait the media to be loaded"
        context.debugMessage = debug
        LoggerInHouse.instance.log(message: debug, event: .warning)
    }

    func stop() {
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
        /*
         It seems to be a good idea to reset player current item
         Loading clip media from playing state, play automatically the new clip media
         Ensure player will play only when we ask
         Also some side effect when coming from failed state
         */
        context.player.replaceCurrentItem(with: nil)
        
        let item = createItem(with: url)
        
        startObservingItemStatus(item: item)
        context.currentItem = item
        context.player.replaceCurrentItem(with: item)
    }
    
    private func startObservingItemStatus(item: AVPlayerItem) {
        itemStatusObserving = ItemStatusObservingService(item: item) { [unowned self] status in
            self.moveToNextState(with: status)
        }
    }

    private func startBgTask(context: PlayerContext) {
        context.bgToken = UIApplication.shared.beginBackgroundTask { [context] in
            if let token = context.bgToken { UIApplication.shared.endBackgroundTask(token) }
            context.bgToken = nil
        }
        LoggerInHouse.instance.log(message: "StartBgTask create: \(String(describing: context.bgToken))", event: .info)
    }

    private func moveToNextState(with status: AVPlayerItemStatus) {
        switch status {
        case .unknown:
            assertionFailure()
        case .failed:
            context.changeState(state: FailedState(context: context, error: .itemFailedWhenLoading))
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
