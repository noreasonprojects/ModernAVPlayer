// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// RouteAudioServiceTests.swift
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

final class RouteAudioServiceTests: QuickSpec {
    
    var tested: ModernAVPlayerRouteAudioService!
    var routeChangedReason: AVAudioSession.RouteChangeReason?
    
    override func spec() {
        
        beforeEach {
            self.routeChangedReason = nil
            self.tested = ModernAVPlayerRouteAudioService()
            self.tested.onRouteChanged = { [weak self] in self?.routeChangedReason = $0 }
        }
        
        describe("initialization") {
            context("valid audio route changed reason") {
                it("should register to AVAudioSessionRouteChange notification ") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: 2]
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.routeChangedReason).to(equal(AVAudioSession.RouteChangeReason.oldDeviceUnavailable))
                }
            }
            
            context("missing notification userinfo") {
                it("should not update route changed") {
                    
                    // ARRANGE
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = nil
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.routeChangedReason).to(beNil())
                }
            }
            
            context("invalid userinfo parameter") {
                it("should not update route changed") {
                    
                    // ARRANGE
                    let info: [String: String] = [AVAudioSessionRouteChangeReasonKey: "42"]
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.routeChangedReason).to(beNil())
                }
            }

        }
    }
}
