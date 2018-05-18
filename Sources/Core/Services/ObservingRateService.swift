//
//  ObservingRateService.swift
//  RFAVPlayer
//
//  Created by Jean-Charles Dessaint on 20/04/2018.
//

import AVFoundation

public protocol ObservingRateServiceProtocol {
    init(config: ContextConfiguration, item: AVPlayerItem)
    
    var onPlaying: (() -> Void)? { get set }
    var onTimeout: (() -> Void)? { get set }

    func start()
}

final class ObservingRateService: ObservingRateServiceProtocol {
    
    // MARK: - Private vars
    
    private var timer: Timer?
    private let timeInterval: TimeInterval
    private var remainingTime: TimeInterval = 0
    private let config: ContextConfiguration
    private let item: AVPlayerItem

    // MARK: - Lifecycle
    
    init(config: ContextConfiguration, item: AVPlayerItem) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        timeInterval = config.playerRateObserving
        self.config = config
        self.item = item
    }
    
    deinit {
        timer?.invalidate()
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    // MARK: - ObservingRateServiceProtocol
    
    var onPlaying: (() -> Void)?
    var onTimeout: (() -> Void)?
    
    func start() {
        LoggerInHouse.instance.log(message: "Item: \(item)", event: .verbose)
        remainingTime = config.timeoutBuffering
        timer?.invalidate()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: self.timeInterval,
                                              target: self,
                                              selector: #selector(self.blockTimer),
                                              userInfo: nil,
                                              repeats: true)
        }
    }
    
    @objc
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
            LoggerInHouse.instance.log(message: "Remaining time: \(remainingTime)", event: .verbose)
        }
    }
}
