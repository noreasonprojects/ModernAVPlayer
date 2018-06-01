// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ReachabilityServiceTests.swift
// Created by raphael ankierman on 03/05/2018.
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

import AVFoundation
import Quick
@testable
import ModernAVPlayer
import Nimble

final class ReachabilityServiceTests: QuickSpec {
    
    var tested: ReachabilityService!
    var config: PlayerConfiguration!
    var isReachable: Bool?
    var isTimedOut: Bool?
    var mockTimerFactory: MockTimerFactory!
    var dataTaskFactory: MockDataTaskFactory!
    
    override func spec() {
        
        beforeEach {
            self.isReachable = nil
            self.isTimedOut = nil
            self.dataTaskFactory = MockDataTaskFactory()
            self.mockTimerFactory = MockTimerFactory()
            self.config = ModernAVPlayerConfiguration()
            self.tested = ModernAVPlayerReachabilityService(config: self.config, dataTaskFactory: self.dataTaskFactory, timerFactory: self.mockTimerFactory)
            self.tested.isReachable = { [weak self] in self?.isReachable = true }
            self.tested.isTimedOut = { [weak self] in self?.isTimedOut = true }
        }
        
        describe("deinit service") {
            it("should invalidate timer") {
                
                // ACT - closure used to deinit the instance
                {
                    let service = ModernAVPlayerReachabilityService(config: self.config, dataTaskFactory: self.dataTaskFactory, timerFactory: self.mockTimerFactory)
                    service.start()
                }()
                
                
                // ASSERT
                expect(self.mockTimerFactory.timer.invalidate_CallCount).to(equal(1))
            }
            
            it("should cancel pending network task") {
                
                // ACT - closure used to deinit the instance
                {
                    let service = ModernAVPlayerReachabilityService(config: self.config, dataTaskFactory: self.dataTaskFactory, timerFactory: self.mockTimerFactory)
                    service.start()
                    self.mockTimerFactory.lastCompletion?()
                }()
                
                // ASSERT
                expect(self.dataTaskFactory.dataTask.cancel_CallCount).to(equal(1))
            }
        }
        
        describe("start service") {
            it("should fire timer ") {
                
                // ACT
                self.tested.start()
                
                // ASSERT
                expect(self.mockTimerFactory.timer.fire_CallCount).to(equal(1))
            }
            
            context("max network iteration reach") {
                it("should call isTimedOut callback") {
                    
                    // ACT
                    self.tested.start()
                    let maxIterationAvailable = self.config.reachabilityNetworkTestingIteration
                    (0...maxIterationAvailable).forEach { _ in
                        self.mockTimerFactory.lastCompletion?()
                    }
                    
                    // ASSERT
                    expect(self.isTimedOut).to(beTrue())
                }
                
                it("should invalidate timer") {
                    
                    // ACT
                    self.tested.start()
                    let maxIterationAvailable = self.config.reachabilityNetworkTestingIteration
                    (0...maxIterationAvailable).forEach { _ in
                        self.mockTimerFactory.lastCompletion?()
                    }
                    
                    // ASSERT
                    expect(self.mockTimerFactory.timer.invalidate_CallCount).to(equal(1))
                }
            }
            
            context("max network iteration not reach") {
                it("should not invalidate timer") {
                    
                    // ACT
                    self.tested.start()
                    let maxIterationAvailable = self.config.reachabilityNetworkTestingIteration - 1
                    var iteration = 0
                    
                    while iteration < maxIterationAvailable {
                        self.mockTimerFactory.lastCompletion?()
                        iteration += 1
                    }
                    
                    // ASSERT
                    expect(self.mockTimerFactory.timer.invalidate_CallCount).to(equal(0))
                }
            }
            
            context("network iteration") {
                it("should resume network task") {
                    
                    // ACT
                    self.tested.start()
                    self.mockTimerFactory.lastCompletion?()
                    
                    // ASSERT
                    expect(self.dataTaskFactory.dataTask.resume_CallCount).to(equal(1))
                }
            }
            
            context("request succeed") {
                it("should invalidate timer") {
                    
                    // ACT
                    self.tested.start()
                    self.mockTimerFactory.lastCompletion?()
                    let httpResponse = HTTPURLResponse(url: URL(string: "foo")!, statusCode: 200, httpVersion: nil, headerFields: nil)
                    self.dataTaskFactory.lastCompletionHandler?(nil, httpResponse, nil)
                    
                    // ASSERT
                    expect(self.mockTimerFactory.timer.invalidate_CallCount).to(equal(1))
                }
                it("should set isReachable") {
                    
                    // ACT
                    self.tested.start()
                    self.mockTimerFactory.lastCompletion?()
                    let httpResponse = HTTPURLResponse(url: URL(string: "foo")!, statusCode: 200, httpVersion: nil, headerFields: nil)
                    self.dataTaskFactory.lastCompletionHandler?(nil, httpResponse, nil)
                    
                    // ASSERT
                    expect(self.isReachable).to(beTrue())
                }
            }
        }
    }
}
