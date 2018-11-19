// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayingStateSpecs.swift
// Created by raphael ankierman on 28/02/2018.
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
import Foundation
import Quick
@testable
import ModernAVPlayer
import Nimble
import SwiftyMocky

final class PlayingStateSpecs: QuickSpec {

    private var media: PlayerMedia!
    private var playingState: PlayingState!
    private var itemPlaybackObservingService: MockItemPlaybackObservingService!
    private var mockPlayer: MockCustomPlayer!
    private var tested: ModernAVPlayerContext!
    private var routeAudioService: ModernAVPlayerRouteAudioService!
    private var delegate: MockPlayerContextDelegate!

    override func spec() {

        beforeEach {
            self.routeAudioService = ModernAVPlayerRouteAudioService()
            self.mockPlayer = MockCustomPlayer.createOne(url: "foo")
            self.media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.itemPlaybackObservingService = MockItemPlaybackObservingService()
            self.delegate = MockPlayerContextDelegate()
            self.tested = ModernAVPlayerContext(player: self.mockPlayer,
                                                config: ModernAVPlayerConfiguration(),
                                                plugins: [])
            self.tested.delegate = self.delegate
            self.tested.currentMedia = self.media
            self.playingState = PlayingState(context: self.tested,
                                             itemPlaybackObservingService: self.itemPlaybackObservingService,
                                             routeAudioService: self.routeAudioService)
            self.tested.state = self.playingState
        }

        context("init") {
            it("should set itemPlaybackObservingService callbacks") {
                
                // ASSERT
                expect(self.itemPlaybackObservingService.onPlaybackStalled).toNot(beNil())
                expect(self.itemPlaybackObservingService.onPlayToEndTime).toNot(beNil())
            }
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {
                
                // ACT
                self.playingState.load(media: self.media, autostart: false)
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("pause") {
            it("should update state context to Paused") {

                // ACT
                self.playingState.pause()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("stop") {
            it("should update state context to Stopped") {

                // ACT
                self.playingState.stop()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }

        context("play") {
            it("should not update state context") {

                // ACT
                self.playingState.play()

                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.playingState))
            }
        }

        context("seek") {
            it("should update state to buffering") {

                //ARRANGE
                let position: Double = 42

                // ACT
                self.playingState.seek(position: position)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(BufferingState.self))
            }
        }
        
        context("observing item onPlaybackStalled") {
            it("should update state context to WaitingNetwork") {

                // ACT
                self.itemPlaybackObservingService.onPlaybackStalled?()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(WaitingNetworkState.self))
            }
        }
        
        context("observing item onFailedToPlayToEndTime") {
            it("should update state context to WaitingNetwork") {
                
                // ACT
                self.itemPlaybackObservingService.onFailedToPlayToEndTime?()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(WaitingNetworkState.self))
            }
        }
        
        context("observing item onPlayToEndTime") {
            it("should call associated delegate method") {
                
                // ACT
                self.itemPlaybackObservingService.onPlayToEndTime?()
                
                // ASSERT
                expect(self.delegate.didItemPlayToEndTimeCallCount).to(equal(1))
            }

            context("loop mode disable") {
                it("should update state context to Stopped") {
                    // ARRANGE
                    self.tested.loopMode = false

                    // ACT
                    self.itemPlaybackObservingService.onPlayToEndTime?()

                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
                }
            }

            context("loop mode enable") {
                it("should update state context to Buffering") {
                    // ARRANGE
                    self.tested.loopMode = true

                    // ACT
                    self.itemPlaybackObservingService.onPlayToEndTime?()

                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(BufferingState.self))
                }
            }
        }
        
        describe("route audio session changed") {
            context("device is unplugged") {
                it("should pause the player") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSession.RouteChangeReason.oldDeviceUnavailable.rawValue]
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
                }
            }
            
            context("unknown reason") {
                it("should pause the player") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSession.RouteChangeReason.unknown.rawValue]
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
                }
            }
            
            context("device is plugged") {
                it("should stay in playing mode") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSession.RouteChangeReason.newDeviceAvailable.rawValue]
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.tested.state).to(beIdenticalTo(self.playingState))
                }
            }
            
            context("new category set") {
                it("should stay in playing mode") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSession.RouteChangeReason.categoryChange.rawValue]
                    var notif = Notification(name: AVAudioSession.routeChangeNotification)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.tested.state).to(beIdenticalTo(self.playingState))
                }
            }
        }
    }
}
