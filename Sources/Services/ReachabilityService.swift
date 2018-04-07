//
//  NetworkReachability.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 16/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

final class ReachabilityService {

    // MARK: - Private vars

    private let url: URL
    private var networkIteration: UInt
    private let timeoutURLSession: TimeInterval
    private var timer: Timer?
    private var tiNetworkTesting: TimeInterval
    private var networkTask: URLSessionTask?
    private var session: URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.timeoutIntervalForRequest = timeoutURLSession
        return URLSession(configuration: config)
    }

    var isReachable: ((Bool) -> Void)?

    // MARK: - Init

    init(url: URL, timeoutURLSession: TimeInterval, tiNetworkTesting: TimeInterval, networkIteration: UInt) {
        self.url = url
        self.timeoutURLSession = timeoutURLSession
        self.tiNetworkTesting = tiNetworkTesting
        self.networkIteration = networkIteration
    }

    deinit {
        print("------- Deinit ∫∫∫∫∫ ReachabilityService ∫∫∫∫∫∫∫∫")
        networkTask?.cancel()
        timer?.invalidate()
    }

    // MARK: - Session & Task

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: tiNetworkTesting, repeats: true) { [weak self] _ in
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
        networkTask = session.dataTask(with: url) { [weak self] _, response, error in
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
