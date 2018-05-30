//
//  MockURLSession.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 30/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable
import ModernAVPlayer
import Nimble

final class MockDataTaskFactory: URLSessionDataTaskFactory {
    
    var dataTask = MockURLSessionDataTask()
    var lastCompletionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    func getDataTask(with url: URL, timeout: TimeInterval, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> CustomURLSessionDataTask {
        lastCompletionHandler = completionHandler
        return dataTask
    }
}
