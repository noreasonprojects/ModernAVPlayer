// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// InterruptionAudioServiceTests.swift
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

final class InterruptionAudioServiceTests: QuickSpec {
    
    var tested: ModernAVPlayerInterruptionAudioService!
    var interruptionType: AVAudioSession.InterruptionType?
    
    override func spec() {
        
        beforeEach {
            self.interruptionType = nil
            self.tested = ModernAVPlayerInterruptionAudioService()
            self.tested.onInterruptionBegan = { [weak self] in self?.interruptionType = .began }
            self.tested.onInterruptionEnded = { [weak self] in self?.interruptionType = .ended }
        }
        
        describe("init") {
            context("valid began interruption occured") {
                it("should register to interruption notification") {
                    
                    // ARRANGE
                    let interruptionType = AVAudioSession.InterruptionType.began
                    let info: [String: UInt] = [AVAudioSessionInterruptionTypeKey: interruptionType.rawValue]
                    var notif = Notification(name: AVAudioSession.interruptionNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.interruptionType).to(equal(interruptionType))
                }
            }
            
            context("valid ended interruption occured") {
                it("should register to interruption notification") {
                    
                    // ARRANGE
                    let interruptionType = AVAudioSession.InterruptionType.ended
                    let info: [String: UInt] = [AVAudioSessionInterruptionTypeKey: interruptionType.rawValue]
                    var notif = Notification(name: AVAudioSession.interruptionNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.interruptionType).to(equal(interruptionType))
                }
            }
            
            context("missing notification user info") {
                it("should not execute interruption") {
                    
                    // ARRANGE
                    let notif = Notification(name: AVAudioSession.interruptionNotification)
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.interruptionType).to(beNil())
                }
            }
            
            context("invalid user info parameter") {
                it("should not execute interruption") {
                    
                    // ARRANGE
                    let info: [String: String] = [AVAudioSessionInterruptionTypeKey: "3"]
                    var notif = Notification(name: AVAudioSession.interruptionNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.interruptionType).to(beNil())
                }
            }
            
        }
    }
}
