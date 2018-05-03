//
//  RouteAudioServiceTests.swift
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

final class RouteAudioServiceTests: QuickSpec {
    
    var tested: RouteAudioService!
    var routeChangedReason: AVAudioSessionRouteChangeReason?
    
    override func spec() {
        
        beforeEach {
            self.routeChangedReason = nil
            self.tested = RouteAudioService()
            self.tested.onRouteChanged = { [weak self] in self?.routeChangedReason = $0 }
        }
        
        describe("initialization") {
            context("valid audio route changed reason") {
                it("should register to AVAudioSessionRouteChange notification ") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: 2]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionRouteChange)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.routeChangedReason).to(equal(AVAudioSessionRouteChangeReason.oldDeviceUnavailable))
                }
            }
            
            context("invalid audio route changed reason") {
                it("should not update route changed") {
                    
                    // ARRANGE
                    let info: [String: Any] = [AVAudioSessionRouteChangeReasonKey: 42]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionRouteChange)
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
