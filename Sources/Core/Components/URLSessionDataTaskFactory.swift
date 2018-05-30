//
//  URLSessionDataTaskFactory.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 02/05/2018.
//

import Foundation

protocol CustomURLSessionDataTask {
    func cancel()
    func resume()
}
extension URLSessionDataTask: CustomURLSessionDataTask { }

protocol URLSessionDataTaskFactory {
    func getDataTask(with url: URL,
                     timeout: TimeInterval,
                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> CustomURLSessionDataTask
}

struct ModernAVPlayerURLSessionDataTaskFactory: URLSessionDataTaskFactory {
    
    func getDataTask(with url: URL,
                     timeout: TimeInterval,
                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> CustomURLSessionDataTask {
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.timeoutIntervalForRequest = timeout
        return URLSession(configuration: sessionConfig).dataTask(with: url, completionHandler: completionHandler)
    }
}
