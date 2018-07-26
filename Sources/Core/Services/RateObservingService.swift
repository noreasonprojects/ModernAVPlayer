// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// RateObservingService.swift
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

import AVFoundation

protocol RateObservingService {
    var onPlaying: (() -> Void)? { get set }
    var onTimeout: (() -> Void)? { get set }

    func start()
    func stop(clearCallbacks: Bool)
}

final class ModernAVPlayerRateObservingService: RateObservingService {
    
    // MARK: - Inputs
    
    private let item: AVPlayerItem
    private let timeInterval: TimeInterval
    private let timeout: TimeInterval
    private let timerFactory: TimerFactory

    // MARK: - Outputs
    
    var onPlaying: (() -> Void)?
    var onTimeout: (() -> Void)?
    
    // MARK: - Variables
    
    private weak var timer: CustomTimer?
    private var remainingTime: TimeInterval = 0

    // MARK: - Lifecycle
    
    init(config: PlayerConfiguration, item: AVPlayerItem, timerFactory: TimerFactory = ModernAVPlayerTimerFactory()) {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleService)
        timeInterval = config.rateObservingTickTime
        timeout = config.rateObservingTimeout
        self.timerFactory = timerFactory
        self.item = item
    }
    
    deinit {
        timer?.invalidate()
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleService)
    }
    
    // MARK: - Rate Service
    
    func start() {
        ModernAVPlayerLogger.instance.log(message: "Item: \(item)", domain: .service)
        remainingTime = timeout
        timer?.invalidate()
        DispatchQueue.main.async {
            self.timer = self.timerFactory.getTimer(timeInterval: self.timeInterval, repeats: true, block: self.blockTimer)
        }
    }
    
    func stop(clearCallbacks: Bool) {
        if clearCallbacks { self.clearCallbacks() }
        timer?.invalidate()
        timer = nil
    }
    
    private func clearCallbacks() {
        onPlaying = nil
        onTimeout = nil
    }
    
    func blockTimer() {
        guard let timebase = item.timebase else { return }
        
        remainingTime -= timeInterval
        let rate = CMTimebaseGetRate(timebase)
        if rate != 0 {
            timer?.invalidate()
            onPlaying?()
        } else if remainingTime <= 0 {
            timer?.invalidate()
            onTimeout?()
        } else {
            ModernAVPlayerLogger.instance.log(message: "Remaining time: \(remainingTime)", domain: .service)
        }
    }
}
