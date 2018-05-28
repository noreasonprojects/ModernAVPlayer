//
//  NetworkReachability.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 16/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

protocol ReachabilityService {
    var isReachable: (() -> Void)? { get set }
    var isTimedOut: (() -> Void)? { get set }
    
    func start()
}

final class ModernAVPlayerReachabilityService: ReachabilityService {

    // MARK: - Inputs
    
    private let dataTaskFactory: URLSessionDataTaskFactory
    private var remainingNetworkIteration: UInt
    private let timeoutURLSession: TimeInterval
    private let timerFactory: TimerFactory
    private let tiNetworkTesting: TimeInterval
    private let url: URL
    
    // MARK: - Outputs
    
    var isReachable: (() -> Void)?
    var isTimedOut: (() -> Void)?
    
    // MARK: - Variables

    private var timer: CustomTimer? {
        didSet { timer?.fire() }
    }
    private var networkTask: CustomURLSessionDataTask? {
        willSet { networkTask?.cancel() }
        didSet { networkTask?.resume() }
    }

    // MARK: - Init

    init(config: PlayerConfiguration,
         dataTaskFactory: URLSessionDataTaskFactory = ModernAVPlayerURLSessionDataTaskFactory(),
         timerFactory: TimerFactory = ModernAVPlayerTimerFactory()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        
        self.dataTaskFactory = dataTaskFactory
        self.timerFactory = timerFactory
        self.url = config.reachabilityNetworkTestingURL
        self.timeoutURLSession = config.reachabilityURLSessionTimeout
        self.tiNetworkTesting = config.reachabilityNetworkTestingTickTime
        self.remainingNetworkIteration = config.reachabilityNetworkTestingIteration
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        cancelTasks()
    }

    // MARK: - Session & Task

    func start() {
        timer = timerFactory.getTimer(timeInterval: tiNetworkTesting, repeats: true) { [weak self] in
            guard let strongSelf = self else { return }
            
            guard strongSelf.remainingNetworkIteration > 0
                else {
                    strongSelf.cancelTasks()
                    strongSelf.isTimedOut?()
                    return
            }
            strongSelf.remainingNetworkIteration -= 1
            strongSelf.setNetworkTask()
        }
    }

    private func setNetworkTask() {
        networkTask = dataTaskFactory.getDataTask(with: url, timeout: timeoutURLSession) { [weak self] _, response, error in
            guard
                error == nil,
                let r = response as? HTTPURLResponse,
                r.statusCode >= 200 && r.statusCode < 300
                else { LoggerInHouse.instance.log(message: "Unreachable network", event: .info); return }
            
            self?.timer?.invalidate()
            self?.isReachable?()
        }
    }
    
    private func cancelTasks() {
        networkTask?.cancel()
        timer?.invalidate()
    }
}
