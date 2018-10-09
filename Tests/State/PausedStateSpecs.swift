// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PausedStateSpecs.swift
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

final class PausedStateSpecs: QuickSpec {

    private var audioSession: MockAudioSession!
    private var tested: PausedState!
    private var mockPlayer: MockCustomPlayer!
    private var media: MockPlayerMedia!
    private var playerContext: ModernAVPlayerContext!
    private var plugin: PlayerPluginMock!
    private var item: MockPlayerItem!
    private var delegate: MockPlayerContextDelegate!
    private let position = CMTime(seconds: 42.0, preferredTimescale: CMTimeScale(1.0))

    override func spec() {

        beforeEach {
            self.audioSession = MockAudioSession()
            self.delegate = MockPlayerContextDelegate()
            self.item = MockPlayerItem.createOne(url: "foo", status: .unknown)
            self.media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.plugin = PlayerPluginMock()
            self.mockPlayer = MockCustomPlayer(overrideCurrentItem: self.item)
            self.mockPlayer.overrideCurrentTime = self.position
            self.playerContext = ModernAVPlayerContext(player: self.mockPlayer,
                                                       config: ModernAVPlayerConfiguration(),
                                                       audioSession: self.audioSession,
                                                       plugins: [self.plugin])
            self.playerContext.delegate = self.delegate
            self.playerContext.currentMedia = self.media
            self.tested = PausedState(context: self.playerContext)
            self.playerContext.state = self.tested
        }

        context("init") {
            it("should pause the player") {

                // ASSERT
                expect(self.mockPlayer.pauseCallCount).to(equal(1))
            }
            
            it("should execute plugin method") {

                // ASSERT
                Verify(self.plugin, 1, .didPaused(media: .matching { $0.url == self.media.url },
                                                  position: .value(self.position.seconds)))
            }
        }

        context("loadMedia") {
            it("should update state context to LoadingMedia") {

                // ACT
                self.tested.load(media: self.media, autostart: false)

                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("play") {
            context("when item status is readyToPlay") {
                it("should update state context to Buffering") {

                    // ARRANGE
                    self.item.overrideStatus = .readyToPlay

                    // ACT
                    self.tested.play()

                    // ASSERT
                    expect(self.playerContext.state).to(beAnInstanceOf(BufferingState.self))
                }
            }

            context("when item status is unknown") {
                it("should update state context to Loading") {

                    // ARRANGE
                    self.item.overrideStatus = .unknown

                    // ACT
                    self.tested.play()

                    // ASSERT
                    expect(self.playerContext.state).to(beAnInstanceOf(LoadingMediaState.self))
                }
            }
            
            context("when item status is failed") {
                it("should update state context to Loading") {
                    
                    // ARRANGE
                    self.item.overrideStatus = .failed
                    
                    // ACT
                    self.tested.play()
                    
                    // ASSERT
                    expect(self.playerContext.state).to(beAnInstanceOf(LoadingMediaState.self))
                }
            }
            
            context("when current item & media are not set") {
                it("should not update state context") {
                    
                    // ARRANGE
                    self.mockPlayer.overrideCurrentItem = nil
                    self.playerContext.currentMedia = nil
                    
                    // ACT
                    self.tested.play()
                    
                    // ASSERT
                    expect(self.playerContext.state).to(beAnInstanceOf(PausedState.self))
                }
            }
        }

        context("stop") {
            it("should update state context to Stopped") {

                // ACT
                self.tested.stop()

                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(StoppedState.self))
            }
        }

        context("pause") {
            it("should not update state context") {

                // ACT
                self.tested.pause()

                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("seek completed to 42") {
            beforeEach {
                
                // ARRANGE
                let position = CMTime(seconds: 42, preferredTimescale: 1)
                self.mockPlayer.seekCompletionHandlerReturn = true
                
                // ACT
                self.tested.seek(position: position.seconds)
            }
            
            it("should call player seek") {

                // ASSERT
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(1))
                expect(self.mockPlayer.seekCompletionLastParam?.seconds).to(equal(42))
            }
            
            it("should call didCurrenTimeChange") {
                expect(self.delegate.didCurrentTimeChangeCallCount).to(equal(1))
            }
        }
        
        context("seek cancelled") {
            beforeEach {
                
                // ARRANGE
                let position = CMTime(seconds: 42, preferredTimescale: 1)
                self.mockPlayer.seekCompletionHandlerReturn = false
                
                // ACT
                self.tested.seek(position: position.seconds)
            }
            
            it("should call player seek") {
                
                // ASSERT
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(1))
                expect(self.mockPlayer.seekCompletionLastParam?.seconds).to(equal(42))
            }
            
            it("should call didCurrenTimeChange") {
                expect(self.delegate.didCurrentTimeChangeCallCount).to(equal(0))
            }
        }
    }
}
