// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ItemPlaybackObservingServiceTests.swift
// Created by Jean-Charles Dessaint on 27/04/2018.
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
@testable import ModernAVPlayer
import Nimble

final class ItemPlaybackObservingServiceTests: QuickSpec {

    private var tested: ModernAVPlayerPlaybackObservingService!
    private var wasPlaybackStalledCalled: Bool!
    private var wasPlayToEndTimeCalled: Bool!
    private var wasFailedToPlayToEndTime: Bool!
    private var player: MockCustomPlayer!
    private var item: MockPlayerItem!

    override func spec() {
        
        beforeEach {
            self.item = MockPlayerItem.createOne(url: "foo", duration: CMTime(seconds: 100, preferredTimescale: 1), status: .readyToPlay)
            self.player = MockCustomPlayer(overrideCurrentItem: self.item)
            self.wasPlaybackStalledCalled = false
            self.wasPlayToEndTimeCalled = false
            self.wasFailedToPlayToEndTime = false
            self.tested = ModernAVPlayerPlaybackObservingService(player: self.player)
            self.tested.onPlaybackStalled = { [weak self] in self?.wasPlaybackStalledCalled = true }
            self.tested.onPlayToEndTime = { [weak self] in self?.wasPlayToEndTimeCalled = true }
            self.tested.onFailedToPlayToEndTime = { [weak self] in self?.wasFailedToPlayToEndTime = true }
        }
        
        context("trigger AVPlayerItemPlaybackStalled notification") {
            it("should call associated callback") {
                
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemPlaybackStalled))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beTrue())
                expect(self.wasPlayToEndTimeCalled).to(beFalse())
                expect(self.wasFailedToPlayToEndTime).to(beFalse())
            }
        }
            
        context("trigger AVPlayerItemDidPlayToEndTime but item has reached his end time") {
            it("should call onPlayToEndTime callback") {
            
                // ARRANGE
                self.player.overrideCurrentTime = CMTime(seconds: 100, preferredTimescale: 1)
                
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemDidPlayToEndTime))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beFalse())
                expect(self.wasPlayToEndTimeCalled).to(beTrue())
                expect(self.wasFailedToPlayToEndTime).to(beFalse())
            }
        }
        
        context("trigger AVPlayerItemDidPlayToEndTime but item has not reached his end time") {
            it("should call onFailedToPlayToEndTime callback") {
                
                // ARRANGE
                self.player.overrideCurrentTime = CMTime(seconds: 42, preferredTimescale: 1)
                
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemDidPlayToEndTime))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beFalse())
                expect(self.wasPlayToEndTimeCalled).to(beFalse())
                expect(self.wasFailedToPlayToEndTime).to(beTrue())
            }
        }
            
        context("trigger AVPlayerItemFailedToPlayToEndTime notification") {
            it("should call associated callback") {
                
                // ACT
                NotificationCenter.default.post(Notification.init(name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime))
                
                // ASSERT
                expect(self.wasPlaybackStalledCalled).to(beFalse())
                expect(self.wasPlayToEndTimeCalled).to(beFalse())
                expect(self.wasFailedToPlayToEndTime).to(beTrue())
            }
        }
    }
}
