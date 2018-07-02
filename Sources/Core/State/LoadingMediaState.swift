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
    
    var type: ModernAVPlayer.State = .loading
    private let autostart: Bool
    private let lastKnownPosition: CMTime?
    private var itemStatusObserving: ModernAVPLayerItemStatusObservingService?
    private var interruptionAudioService: ModernAVPlayerInterruptionAudioService

    // MARK: - Init

    init(context: PlayerContext,
         media: PlayerMedia? = nil,
         autostart: Bool,
         lastPosition: CMTime? = nil,
         interruptionAudioService: ModernAVPlayerInterruptionAudioService = ModernAVPlayerInterruptionAudioService()) {
        LoggerInHouse.instance.log(message: "Entering loading state", event: .info)
        
        self.context = context
        self.autostart = autostart
        self.lastKnownPosition = lastPosition
        self.interruptionAudioService = interruptionAudioService
        
        context.audioSessionType.activate()
        
        setupInterruptionCallback()
        startBgTask(context: context)
        createReplaceItem(media: media)
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    private func setupInterruptionCallback() {
        interruptionAudioService.onInterruptionBegan = { [weak self] in self?.pause() }
    }

    // MARK: - Shared actions

    func loadCurrentMedia(media: PlayerMedia, autostart: Bool) {
        createReplaceItem(media: media)
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
        return AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: ["playable", "duration"])
    }

    private func createReplaceItem(media: PlayerMedia? = nil) {
        /*
         It seems to be a good idea to reset player current item
         Loading clip media from playing state, play automatically the new clip media
         Ensure player will play only when we ask
         Also some side effect when coming from failed state
         */
        context.plugins.forEach { $0.willStartLoading() }
        context.player.replaceCurrentItem(with: nil)
        context.itemDuration = nil
        
        guard let url = media?.url else { assertionFailure(); return }
        let item = createItem(with: url)
        
        startObservingItemStatus(item: item)
        context.currentItem = item
        context.currentMedia = media
        context.player.replaceCurrentItem(with: item)
        context.delegate?.playerContext(didCurrentMediaChange: media)
        context.plugins.forEach { $0.didStartLoading() }
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
        LoggerInHouse.instance.log(message: "StartBgTask create: \(String(describing: context.bgToken))", event: .debug)
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
        let state = LoadedState(context: self.context)
        self.context.changeState(state: state)
        if self.autostart { state.play() }
    }
}
