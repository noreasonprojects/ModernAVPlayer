// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlaybackObservingService.swift
// Created by Jean-Charles Dessaint on 20/04/2018.
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

import Foundation

protocol PlaybackObservingService {
    var onPlaybackStalled: (() -> Void)? { get set }
    var onPlayToEndTime: (() -> Void)? { get set }
    var onFailedToPlayToEndTime: (() -> Void)? { get set }
}

final class ModernAVPlayerPlaybackObservingService: PlaybackObservingService {
    
    // MARK: - Outputs
    
    var onPlaybackStalled: (() -> Void)?
    var onPlayToEndTime: (() -> Void)?
    var onFailedToPlayToEndTime: (() -> Void)?
    
    // MARK: - Init
    
    init() {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        NotificationCenter.default.addObserver(self, selector: #selector(ModernAVPlayerPlaybackObservingService.itemPlaybackStalled),
                                               name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ModernAVPlayerPlaybackObservingService.itemPlayToEndTime),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ModernAVPlayerPlaybackObservingService.itemFailedToPlayToEndTime),
                                               name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime, object: nil)
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
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
    
    @objc
    private func itemPlaybackStalled() {
        LoggerInHouse.instance.log(message: "Item playback stalled notification", event: .debug)
        onPlaybackStalled?()
    }
    
    @objc
    private func itemPlayToEndTime() {
        LoggerInHouse.instance.log(message: "Item play to end time notification", event: .debug)
        onPlayToEndTime?()
    }
    
    @objc
    private func itemFailedToPlayToEndTime() {
        LoggerInHouse.instance.log(message: "Item failed to play endtime notification", event: .debug)
        onFailedToPlayToEndTime?()
    }
}
