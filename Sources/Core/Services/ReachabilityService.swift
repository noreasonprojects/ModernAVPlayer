//
//  NetworkReachability.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 16/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

public protocol ReachabilityServiceProtocol {
    var isReachable: (() -> Void)? { get set }
    var isTimedOut: (() -> Void)? { get set }
    
    func start()
}

public final class ReachabilityService: ReachabilityServiceProtocol {

    // MARK: - Input
    
    private let dataTaskFactory: URLSessionDataTaskFactoryProtocol
    private var networkIteration: UInt
    private let timeoutURLSession: TimeInterval
    private let timerFactory: TimerFactoryProtocol
    private let tiNetworkTesting: TimeInterval
    private let url: URL
    
    // MARK: - Output
    
    public var isReachable: (() -> Void)?
    public var isTimedOut: (() -> Void)?
    
    // MARK: - Variables

    private var timer: TimerProtocol? {
        didSet { timer?.fire() }
    }
    private var networkTask: URLSessionDataTaskProtocol? {
        willSet { networkTask?.cancel() }
        didSet { networkTask?.resume() }
    }

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
            guard let strongSelf = self else { return }
            
            strongSelf.setNetworkTask()
            strongSelf.networkIteration -= 1
            
            guard strongSelf.networkIteration == 0 else { return }
            
            strongSelf.timer?.invalidate()
            strongSelf.isTimedOut?()
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
}
