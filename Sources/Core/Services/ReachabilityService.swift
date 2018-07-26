// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ReachabilityService.swift
// Created by raphael ankierman on 16/03/2018.
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
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleService)
        
        self.dataTaskFactory = dataTaskFactory
        self.timerFactory = timerFactory
        self.url = config.reachabilityNetworkTestingURL
        self.timeoutURLSession = config.reachabilityURLSessionTimeout
        self.tiNetworkTesting = config.reachabilityNetworkTestingTickTime
        self.remainingNetworkIteration = config.reachabilityNetworkTestingIteration
    }

    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleService)
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
                else { ModernAVPlayerLogger.instance.log(message: "Unreachable network", domain: .service); return }
            
            self?.timer?.invalidate()
            self?.isReachable?()
        }
    }
    
    private func cancelTasks() {
        networkTask?.cancel()
        timer?.invalidate()
    }
}
