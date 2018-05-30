//
//  BufferingStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Quick
@testable import ModernAVPlayer
import Nimble

final class BufferingStateSpecs: QuickSpec {

    private let playerMedia = ModernAVPlayerMedia(url: URL(string: "x")!, type: .clip)
    private var bufferingState: BufferingState!
    private var mockPlayer: MockCustomPlayer!
    private var mockItem: MockPlayerItem!
    private var mockRateService: MockObservingRateService!
    private var tested: PlayerContext!

    override func spec() {
        beforeEach {
            self.mockItem = MockPlayerItem.createOne(url: "HELLO")
            self.mockPlayer = MockCustomPlayer()
            self.mockPlayer.overrideCurrentItem = self.mockItem
            self.tested = ModernAVPlayerContext(player: self.mockPlayer, audioSessionType: MockAudioSession.self)
            self.mockRateService = MockObservingRateService(config: self.tested.config, item: self.mockItem)
            self.bufferingState = BufferingState(context: self.tested, rateObservingService: self.mockRateService)
            self.tested.changeState(state: self.bufferingState)
        }

        context("loadMedia") {
            it("should stop observing rate service") {
                
                // ACT
                self.bufferingState.loadMedia(media: self.playerMedia, shouldPlaying: true)
                
                // ASSERT
                expect(self.mockRateService.stopCallCount).to(equal(1))
            }
            
            it("should cancel pending seek") {
                
                // ACT
                self.bufferingState.loadMedia(media: self.playerMedia, shouldPlaying: true)
                
                // ASSERT
                expect(self.mockItem.cancelPendingSeeksCallCount).to(equal(1))
            }
            
            it("should update state context to LoadingMedia") {

                // ACT
                self.bufferingState.loadMedia(media: self.playerMedia, shouldPlaying: false)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("play") {
            it("should not update state context") {

                // ACT
                self.bufferingState.play()

                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.bufferingState.self))
            }
        }
        
        context("playCommand") {
            it("should launch player play command") {
                
                // ACT
                self.bufferingState.playCommand()
                
                // ASSERT
                expect(self.mockPlayer.playCallCount).to(equal(1))
            }
            it("should start observingRateService") {
                
                // ACT
                self.bufferingState.playCommand()
                
                // ASSERT
                expect(self.mockRateService.startCallCount).to(equal(1))
            }
            context("when observingRateService timeouted") {
                it("should update context state to Failed") {
                    
                    // ACT
                    self.bufferingState.playCommand()
                    self.mockRateService.onTimeout?()
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(WaitingNetworkState.self))
                }
            }
            
            context("when observingRateService detects player playing") {
                it("should update context state to Playing") {
                    
                    // ACT
                    self.bufferingState.playCommand()
                    self.mockRateService.onPlaying?()
                    
                    // ASSERT
                    expect(self.tested.state).to(beAnInstanceOf(PlayingState.self))
                }
            }
        }

        context("stop") {
            it("should stop observing rate service") {
                
                // ACT
                self.bufferingState.stop()
                
                // ASSERT
                expect(self.mockRateService.stopCallCount).to(equal(1))
            }
            
            it("should cancel pending seek") {
                
                // ACT
                self.bufferingState.stop()
                
                // ASSERT
                expect(self.mockItem.cancelPendingSeeksCallCount).to(equal(1))
            }
            
            it("should update state context to Stopped") {

                // ACT
                self.bufferingState.stop()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }

        context("pause") {
            it("should stop observing rate service") {
                
                // ACT
                self.bufferingState.pause()
                
                // ASSERT
                expect(self.mockRateService.stopCallCount).to(equal(1))
            }
            
            it("should cancel pending seek") {
                
                // ACT
                self.bufferingState.pause()
                
                // ASSERT
                expect(self.mockItem.cancelPendingSeeksCallCount).to(equal(1))
            }
            
            it("should update state context to Paused") {

                // ACT
                self.bufferingState.pause()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }
        
        context("seek") {
            it("should cancel pending seek") {
                
                // ACT
                self.bufferingState.seek(position: kCMTimeZero.seconds)
                
                // ASSERT
                expect(self.mockItem.cancelPendingSeeksCallCount).to(equal(1))
            }
            
            it("should call player seek command") {
                
                // ACT
                self.bufferingState.seek(position: kCMTimeZero.seconds)
                
                // ASSERT
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(1))
            }
        }
    }
}
