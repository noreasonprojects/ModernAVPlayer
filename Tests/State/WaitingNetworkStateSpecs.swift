// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// WaitingNetworkStateSpecs.swift
// Created by raphael ankierman on 22/05/2018.
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
import Quick
@testable
import ModernAVPlayer
import Nimble
import SwiftyMocky

final class WaitingNetworkStateSpecs: QuickSpec {
    
    private var state: WaitingNetworkState!
    private var mockPlayer = MockCustomPlayer()
    private var url: URL!
    private var playerMedia = MockPlayerMedia(url: URL(string: "x")!, type: .clip)
    private var mockReachability: MockReachability!
    private var tested: ModernAVPlayerContext!
    
    override func spec() {
        beforeEach {
            self.mockReachability = MockReachability()
            self.url = URL(string: "foo")!
            self.tested = ModernAVPlayerContext(player: self.mockPlayer,
                                                config: ModernAVPlayerConfiguration(),
                                                plugins: [])
            self.tested.currentMedia = self.playerMedia
            self.state = WaitingNetworkState(context: self.tested,
                                             urlToReload: self.url,
                                             autostart: true,
                                             error: PlayerError.loadingFailed,
                                             reachabilityService: self.mockReachability)
            self.tested.state = self.state
        }
        
        context("init") {
            it("should start reachability service") {
                
                // ASSERT
                expect(self.mockReachability.start_callCount).to(equal(1))
            }
        }
        
        context("service has timed out") {
            it("should update state context to Failed") {
                
                // ACT
                self.mockReachability.isTimedOut?()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(FailedState.self))
            }
        }
        
        context("service is reachable ") {
            it("should update state context to LoadingMedia") {
                
                // ACT
                self.mockReachability.isReachable?()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {
                
                // ACT
                self.state.load(media: self.playerMedia, autostart: false)
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }
        
        context("play") {
            it("should not update state context") {
                
                // ACT
                self.state.play()
                
                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }
        
        context("seek") {
            it("should not update state context") {
                
                // ACT
                self.state.seek(position: 0)
                
                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }
        
        context("stop") {
            it("should update state context to Stopped") {
                
                // ACT
                self.state.stop()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }
        
        context("pause") {
            it("should update state context to Paused") {
                
                // ACT
                self.state.pause()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }
    }
}
