//
//  StoppedStateSpecs.swift
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

final class StoppedStateSpecs: QuickSpec {
    
    var tested: StoppedState!
    var media: PlayerMedia!
    var mockPlayer: MockCustomPlayer!
    var playerContext: ModernAVPlayerContext!

    override func spec() {

        beforeEach {
            self.mockPlayer = MockCustomPlayer()
            self.playerContext = ModernAVPlayerContext(player: self.mockPlayer, audioSessionType: MockAudioSession.self)
            self.media = ModernAVPlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.tested = StoppedState(context: self.playerContext)
            self.playerContext.state = self.tested
        }

        context("init") {
            it("should play the player and seek to 0") {

                // ASSERT
                expect(self.mockPlayer.pauseCallCount).to(equal(1))
                expect(self.mockPlayer.seekCallCount).to(equal(1))
                expect(self.mockPlayer.lastSeekParam).to(equal(kCMTimeZero))
            }
        }

        context("loadMedia") {
            it("should update state context to LoadingMedia") {

                // ACT
                self.tested.loadMedia(media: self.media, shouldPlaying: false)

                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("play") {
            context("when player status is readyToPlay") {
                beforeEach {
                    // ARRANGE
                    let item = MockPlayerItem.createOne(url: "hello")
                    item.overrideStatus = .readyToPlay
                    self.mockPlayer.overrideCurrentItem = item

                    // ACT
                    self.tested.play()
                }
                it("should update state context to Buffering") {
                    // ASSERT
                    expect(self.playerContext.state).to(beAnInstanceOf(BufferingState.self))
                }
                it("should launch play command on buffering state") {
                    // ASSERT
                    expect(self.mockPlayer.playCallCount).to(equal(1))
                }
            }

            context("when item status is not readyToPlay") {
                it("should not update state context") {

                    // ARRANGE
                    let item = MockPlayerItem.createOne(url: "foo")
                    item.overrideStatus = .unknown
                    self.mockPlayer.overrideCurrentItem = item

                    // ACT
                    self.tested.play()

                    // ASSERT
                    expect(self.playerContext.state).to(beAnInstanceOf(StoppedState.self))
                }
            }
        }

        context("stop") {
            it("should not update state context") {

                // ACT
                self.tested.stop()

                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(StoppedState.self))
            }
        }

        context("pause") {
            it("should update state context to Paused") {

                // ACT
                self.tested.pause()

                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("seek to 42") {
            beforeEach {
                
                // ARRANGE
                let position = CMTime(seconds: 42, preferredTimescale: 1)
                
                // ACT
                self.tested.seek(position: position.seconds)
            }
            it("should forward seek to player") {

                // ASSERT
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(1))
                expect(self.mockPlayer.lastSeekCompletionParam?.seconds).to(equal(42))
            }
            it("should not update state context") {
                
                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(StoppedState.self))
            }
            
            it("should update context current time if completed") {
                
                // ACT
                self.mockPlayer.lastCompletionParam?(true)
                
                // ASSERT
                expect(self.playerContext.currentTime).to(equal(42))
            }
            
            it("should not update context current time if cancelled") {
                
                // ACT
                self.mockPlayer.lastCompletionParam?(false)
                
                // ASSERT
                expect(self.playerContext.currentTime).to(equal(0))
            }
        }
    }
}
