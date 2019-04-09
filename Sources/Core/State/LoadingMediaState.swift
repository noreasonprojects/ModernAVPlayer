// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// LoadingMediaState.swift
// Created by raphael ankierman on 23/02/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import AVFoundation

final class LoadingMediaState: PlayerState {
    
    // MARK: - Input
    
    unowned let context: PlayerContext
    
    // MARK: - Variables
    
    let type: ModernAVPlayer.State = .loading
    private let media: PlayerMedia
    private var autostart: Bool
    private var position: Double?
    private var itemStatusObserving: ModernAVPLayerItemStatusObservingService?
    private var interruptionAudioService: ModernAVPlayerInterruptionAudioService

    // MARK: - Init

    init(context: PlayerContext,
         media: PlayerMedia,
         autostart: Bool,
         position: Double? = nil,
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService()) {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleState)
        
        self.context = context
        self.media = media
        self.autostart = autostart
        self.position = position
        self.interruptionAudioService = interruptionAudioService
        
        /*
         Loading a clip media from playing state, play automatically the new clip media
         Ensure player will play only when we ask
         */
        context.player.pause()
        
        /*
         It seems to be a good idea to reset player current item
         Fix side effect when coming from failed state
         */
        context.player.replaceCurrentItem(with: nil)

        context.audioSession.activate()
        
        setupInterruptionCallback()
        startBgTask(context: context)
    }
    
    func contextUpdated() {
        guard let media = context.currentMedia
            else { assertionFailure("media should exist"); return }
        context.plugins.forEach { $0.willStartLoading(media: media) }
        createReplaceItem(media: media)
        context.plugins.forEach { $0.didStartLoading(media: media) }
    }

    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleState)
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pause() }
    }

    // MARK: - Shared actions

    func load(media: PlayerMedia, autostart: Bool, position: Double? = nil) {
        self.position = position
        self.autostart = autostart
        createReplaceItem(media: media)
    }

    func pause() {
        cancelMediaLoading()
        context.changeState(state: PausedState(context: context))
    }

    func play() {
        let debug = "Please wait to be loaded"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }

    func seek(position: Double) {
        let debug = "Unable to seek, wait the media to be loaded"
        context.debugMessage = debug
        ModernAVPlayerLogger.instance.log(message: debug, domain: .unavailableCommand)
    }

    func stop() {
        cancelMediaLoading()
        context.changeState(state: StoppedState(context: context))
    }

    // MARK: - Private actions
    
    private func cancelMediaLoading() {
        context.currentItem?.asset.cancelLoading()
        context.currentItem?.cancelPendingSeeks()
        context.player.replaceCurrentItem(with: nil)
    }
    
    private func createItem(with media: PlayerMedia) -> AVPlayerItem {
        let asset = AVURLAsset(url: media.url, options: media.assetOptions)
        return AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: ["playable", "duration"])
    }

    private func createReplaceItem(media: PlayerMedia) {
        let item = createItem(with: media)
        
        startObservingItemStatus(item: item)
        context.player.replaceCurrentItem(with: item)
        
        guard position == nil else { return }
        context.delegate?.playerContext(didCurrentTimeChange: context.currentTime)
    }
    
    private func startObservingItemStatus(item: AVPlayerItem) {
        itemStatusObserving = ModernAVPLayerItemStatusObservingService(item: item) { [unowned self] status in
            self.moveToNextState(with: status)
        }
    }

    private func startBgTask(context: PlayerContext) {
        context.bgToken = UIApplication.shared.beginBackgroundTask { [context] in
            if let token = context.bgToken { UIApplication.shared.endBackgroundTask(token) }
            context.bgToken = nil
        }
        ModernAVPlayerLogger.instance.log(message: "StartBgTask create: \(String(describing: context.bgToken))", domain: .service)
    }

    private func moveToNextState(with status: AVPlayerItem.Status) {
        switch status {
        case .unknown:
            assertionFailure()
        case .failed:
            context.changeState(state: FailedState(context: context, error: .loadingFailed))
        case .readyToPlay:
            guard let position = self.position else { moveToLoadedState(); return }
            let seekPosition = CMTime(seconds: position, preferredTimescale: context.config.preferedTimeScale)
            context.player.seek(to: seekPosition) { [context] completed in
                context.delegate?.playerContext(didCurrentTimeChange: context.currentTime)
                guard completed else { return }
                self.moveToLoadedState()
            }
        @unknown default:
            ModernAVPlayerLogger.instance.log(message: "Unknown PlayerItem Status case", domain: .error)
        }
    }

    private func moveToLoadedState() {
        let state = LoadedState(context: self.context)
        self.context.changeState(state: state)
        if self.autostart { state.play() }
    }
}
