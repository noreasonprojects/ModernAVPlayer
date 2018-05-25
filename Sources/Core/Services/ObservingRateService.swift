//
//  ObservingRateService.swift
//  RFAVPlayer
//
//  Created by Jean-Charles Dessaint on 20/04/2018.
//

import AVFoundation

protocol ObservingRateServiceProtocol {
    var onPlaying: (() -> Void)? { get set }
    var onTimeout: (() -> Void)? { get set }

    func start()
}

final class ObservingRateService: ObservingRateServiceProtocol {
    
    // MARK: - Inputs
    
    private let item: AVPlayerItem
    private let timeInterval: TimeInterval
    private let timeout: TimeInterval
    private let timerFactory: TimerFactoryProtocol

    // MARK: - Outputs
    
    var onPlaying: (() -> Void)?
    var onTimeout: (() -> Void)?
    
    // MARK: - Variables
    
    private var timer: TimerProtocol?
    private var remainingTime: TimeInterval = 0

    // MARK: - Lifecycle
    
    init(config: ContextConfiguration,
         item: AVPlayerItem,
         timerFactory: TimerFactoryProtocol = TimerFactory()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        timeInterval = config.playerRateObserving
        timeout = config.timeoutBuffering
        self.timerFactory = timerFactory
        self.item = item
    }
    
    deinit {
        timer?.invalidate()
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
    }
    
    // MARK: - Rate Service
    
    func start() {
        LoggerInHouse.instance.log(message: "Item: \(item)", event: .verbose)
        remainingTime = timeout
        timer?.invalidate()
        DispatchQueue.main.async {
            self.timer = self.timerFactory.getTimer(timeInterval: self.timeInterval, repeats: true, block: self.blockTimer)
        }
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
            LoggerInHouse.instance.log(message: "Remaining time: \(remainingTime)", event: .verbose)
        }
    }
}
