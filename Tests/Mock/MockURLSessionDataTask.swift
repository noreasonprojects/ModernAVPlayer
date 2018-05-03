//
//  MockURLSessionDataTask.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 02/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable
import ModernAVPlayer

final class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    var cancel_CallCount = 0
    func cancel() {
        cancel_CallCount += 1
    }
    
    var resume_CallCount = 0
    func resume() {
        resume_CallCount += 1
    }
}
