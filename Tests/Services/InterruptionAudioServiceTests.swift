//
//  InterruptionAudioServiceTests.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 03/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
import Quick
@testable
import ModernAVPlayer
import Nimble

final class InterruptionAudioServiceTests: QuickSpec {
    
    var tested: InterruptionAudioService!
    var interruptionType: AVAudioSessionInterruptionType?
    
    override func spec() {
        
        beforeEach {
            self.interruptionType = nil
            self.tested = InterruptionAudioService()
            self.tested.onInterruption = { [weak self] in self?.interruptionType = $0 }
        }
        
        describe("init") {
            context("valid interruption occured") {
                it("should register to interruption notification") {
                    
                    // ARRANGE
                    let interruptionType = AVAudioSessionInterruptionType.began
                    let info: [String: UInt] = [AVAudioSessionInterruptionTypeKey: interruptionType.rawValue]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionInterruption)
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
                    let notif = Notification(name: NSNotification.Name.AVAudioSessionInterruption)
                    
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
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionInterruption)
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
