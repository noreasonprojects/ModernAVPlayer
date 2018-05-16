//
//  NetworkReachability.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 16/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

public protocol ReachabilityServiceProtocol {
    var isReachable: ((Bool) -> Void)? { get set }
    
    func start()
}

public final class ReachabilityService: ReachabilityServiceProtocol {

    // MARK: - Private vars

    private let url: URL
    private var networkIteration: UInt
    private let timeoutURLSession: TimeInterval
    private var timer: TimerProtocol?
    private var tiNetworkTesting: TimeInterval
    private var networkTask: URLSessionDataTaskProtocol?
    private let dataTaskFactory: URLSessionDataTaskFactoryProtocol
    private let timerFactory: TimerFactoryProtocol

    public var isReachable: ((Bool) -> Void)?

    // MARK: - Init

    init(config: ContextConfiguration,
         dataTaskFactory: URLSessionDataTaskFactoryProtocol = URLSessionDataTaskFactory(),
         timerFactory: TimerFactoryProtocol = TimerFactory()) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        
        self.dataTaskFactory = dataTaskFactory
        self.timerFactory = timerFactory
        self.url = config.urlNetworkTesting
        self.timeoutURLSession = config.timeoutURLSession
        self.tiNetworkTesting = config.tiNetworkTesting
        self.networkIteration = config.networkIteration
    }

    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        networkTask?.cancel()
        timer?.invalidate()
    }

    // MARK: - Session & Task

    public func start() {
        timer = timerFactory.getTimer(timeInterval: tiNetworkTesting, repeats: true) { [weak self] in
            self?.setNetworkTask()
            self?.networkTask?.resume()

            guard let strongSelf = self else { return }

            strongSelf.networkIteration -= 1
            if strongSelf.networkIteration == 0 {
                strongSelf.timer?.invalidate()
            }
        }
        timer?.fire()
    }

    private func setNetworkTask() {
        networkTask?.cancel()
        networkTask = dataTaskFactory.getDataTask(with: url, timeout: timeoutURLSession) { [weak self] _, response, error in
            guard
                error == nil,
                let r = response as? HTTPURLResponse,
                r.statusCode >= 200 && r.statusCode < 300
                else { self?.isReachable?(false); return }
            
            self?.timer?.invalidate()
            self?.isReachable?(true)
        }
    }
}
