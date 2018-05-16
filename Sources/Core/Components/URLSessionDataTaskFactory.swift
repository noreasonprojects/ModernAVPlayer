//
//  URLSessionDataTaskFactory.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 02/05/2018.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func cancel()
    func resume()
}
extension URLSessionDataTask: URLSessionDataTaskProtocol { }

protocol URLSessionDataTaskFactoryProtocol {
    func getDataTask(with url: URL,
                     timeout: TimeInterval,
                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

struct URLSessionDataTaskFactory: URLSessionDataTaskFactoryProtocol {
    
    func getDataTask(with url: URL,
                     timeout: TimeInterval,
                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.timeoutIntervalForRequest = timeout
        return URLSession(configuration: sessionConfig).dataTask(with: url, completionHandler: completionHandler)
    }
}
