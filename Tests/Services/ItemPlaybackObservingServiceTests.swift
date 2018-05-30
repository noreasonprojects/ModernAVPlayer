//
//  ItemPlaybackObservingServiceTests.swift
//  ModernAVPlayer_Tests
//
//  Created by Jean-Charles Dessaint on 27/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//


import AVFoundation
import Foundation
import Quick
@testable import ModernAVPlayer
import Nimble

final class ItemPlaybackObservingServiceTests: QuickSpec {

    var tested: ModernAVPlayerPlaybackObservingService!
    var wasPlaybackStalledCalled = false
    var wasPlayToEndTimeCalled = false

    override func spec() {
        
        beforeEach {
            self.wasPlaybackStalledCalled = false
            self.wasPlayToEndTimeCalled = false
            self.tested = ModernAVPlayerPlaybackObservingService()
            self.tested.onPlaybackStalled = { [weak self] in self?.wasPlaybackStalledCalled = true }
            self.tested.onPlayToEndTime = { [weak self] in self?.wasPlayToEndTimeCalled = true }
        }
        
        context("init") {
            it("should register to AVPlayerItemPlaybackStalled notification") {
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemPlaybackStalled))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beTrue())
                expect(self.wasPlayToEndTimeCalled).to(beFalse())
            }
            
            it("should register to AVPlayerItemDidPlayToEndTime notification") {
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemDidPlayToEndTime))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beFalse())
                expect(self.wasPlayToEndTimeCalled).to(beTrue())
            }
            
            it("should register to AVPlayerItemFailedToPlayToEndTime notification") {
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beFalse())
                expect(self.wasPlayToEndTimeCalled).to(beFalse())
            }
        }
    }
}
