// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ContextSpecas.swift
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
            self.tested = ModernAVPlayerContext()
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
                let media = ModernAVPlayerMedia(url: URL(string: "foo")!, type: .clip)

                // ACT
                self.tested.loadMedia(media: media, shouldPlaying: false)

                // ASSERT
                expect(self.mockState.loadMedialCallCount).to(equal(1))
                expect(self.mockState.lastMediaParam as? ModernAVPlayerMedia).to(equal(media))
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
