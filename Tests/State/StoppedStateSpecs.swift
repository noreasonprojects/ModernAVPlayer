// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// StoppedStateSpecs.swift
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

final class StoppedStateSpecs: QuickSpec {
    
    private var tested: StoppedState!
    private var media: PlayerMedia<PlayerMediaMetadata>!
    private var mockPlayer: MockCustomPlayer!
    private var playerContext: ModernAVPlayerContext!
    private var plugin: MockPlayerPlugin!

    override func spec() {

        beforeEach {
            self.plugin = MockPlayerPlugin()
            self.mockPlayer = MockCustomPlayer()
            self.playerContext = ModernAVPlayerContext(player: self.mockPlayer, audioSessionType: MockAudioSession.self, plugins: [self.plugin])
            self.media = PlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.tested = StoppedState(context: self.playerContext)
            self.playerContext.state = self.tested
        }

        context("init") {
            it("should execute plugin method") {
                
                // ASSERT
                expect(self.plugin.didStoppedCallCount).to(equal(1))
            }
            
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
                self.tested.loadMedia(media: self.media, autostart: false)

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
