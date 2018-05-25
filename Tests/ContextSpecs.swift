//
//  ContextSpecas.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
import Nimble
import Quick
import AVFoundation
@testable
import ModernAVPlayer

final class ContextSpecs: QuickSpec {
    
    var tested: PlayerContext!
    var mockState: MockPlayerState!
    
    override func spec() {
        
        beforeEach {
            self.tested = ConcretePlayerContext()
            self.mockState = MockPlayerState(context: self.tested)
        }
        
        context("init context") {
            it("should have init state") {
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(InitState.self))
            }
        }
        
        context("pause context") {
            it("should call pause state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.pause()

                // ASSERT
                expect(self.mockState.pauseCallCount).to(equal(1))
            }
        }

        context("play context") {
            it("should call play state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.play()

                // ASSERT
                expect(self.mockState.playCallCount).to(equal(1))
            }
        }

        context("stop context") {
            it("should call stop state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.stop()

                // ASSERT
                expect(self.mockState.stopCallCount).to(equal(1))
            }
        }

        context("seek context") {
            it("should call seek state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.seek(position: 42)

                // ASSERT
                expect(self.mockState.seekCallCount).to(equal(1))
                expect(self.mockState.lastPositionParam).to(equal(42))
            }
        }

        context("call loadMedia context") {
            it("should call loadMedia state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)
                let media = ConcretePlayerMedia(url: URL(string: "foo")!, type: .clip)

                // ACT
                self.tested.loadMedia(media: media, shouldPlaying: false)

                // ASSERT
                expect(self.mockState.loadMedialCallCount).to(equal(1))
                expect(self.mockState.lastMediaParam as? ConcretePlayerMedia).to(equal(media))
                expect(self.mockState.lastShoudlPlayingParam).to(beFalse())
            }
        }

        context("changeState context") {
            it("should change internal state") {

                // ARRANGE
                let newState = MockPlayerState(context: self.tested)

                // ACT
                self.tested.changeState(state: newState)

                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(newState))
            }
        }


    }
}
