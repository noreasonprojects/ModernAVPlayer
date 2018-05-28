//
//  PlayingStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation
import Quick
@testable
import ModernAVPlayer
import Nimble

final class PlayingStateSpecs: QuickSpec {

    var media: PlayerMedia!
    var playingState: PlayingState!
    var itemPlaybackObservingService: MockItemPlaybackObservingService!
    var mockPlayer: MockCustomPlayer!
    var tested: PlayerContext!
    var routeAudioService: RouteAudioService!

    override func spec() {

        beforeEach {
            self.routeAudioService = RouteAudioService()
            self.mockPlayer = MockCustomPlayer.createOne(url: "foo")
            self.media = ConcretePlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.itemPlaybackObservingService = MockItemPlaybackObservingService()
            self.tested = PlayerContext(player: self.mockPlayer)
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
                self.playingState.loadMedia(media: self.media, shouldPlaying: false)
                
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
            it("should update state context to Failed") {

                // ACT
                self.itemPlaybackObservingService.onPlaybackStalled?()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(WaitingNetworkState.self))
            }
        }
        
        context("observing item onPlayToEndTime") {
            context("currentTime is greater than duration") {
                it("should update state context to Stopped") {
                    
                    // ARRANGE
                    self.mockPlayer.overrideCurrentTime = CMTime(seconds: 10, preferredTimescale: 1)
                    self.tested.itemDuration = 1

                    // ACT
                    self.itemPlaybackObservingService.onPlayToEndTime?()
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
                }
            }
            
            context("currentTime is equal duration") {
                it("should update state context to Stopped") {
                    
                    // ARRANGE
                    self.mockPlayer.overrideCurrentTime = CMTime(seconds: 10, preferredTimescale: 1)
                    self.tested.itemDuration = 10
                    
                    // ACT
                    self.itemPlaybackObservingService.onPlayToEndTime?()
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
                }
            }
            
            context("currentTime is less than duration") {
                it("should update state context to Failed") {
                    
                    // ARRANGE
                    self.mockPlayer.overrideCurrentTime = CMTime(seconds: 1, preferredTimescale: 1)
                    self.tested.itemDuration = 10
                    
                    // ACT
                    self.itemPlaybackObservingService.onPlayToEndTime?()
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(WaitingNetworkState.self))
                }
            }
        }
        
        describe("route audio session changed") {
            context("new category set") {
                it("should pause the player") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSessionRouteChangeReason.categoryChange.rawValue]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionRouteChange)
                    notif.userInfo = info
                    
                    // ACT
                    NotificationCenter.default.post(notif)
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
                }
            }
            
            context("device is unplugged") {
                it("should pause the player") {
                    
                    // ARRANGE
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSessionRouteChangeReason.oldDeviceUnavailable.rawValue]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionRouteChange)
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
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSessionRouteChangeReason.unknown.rawValue]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionRouteChange)
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
                    let info: [String: UInt] = [AVAudioSessionRouteChangeReasonKey: AVAudioSessionRouteChangeReason.newDeviceAvailable.rawValue]
                    var notif = Notification(name: NSNotification.Name.AVAudioSessionRouteChange)
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
