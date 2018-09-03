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
import MediaPlayer
@testable
import ModernAVPlayer
import Nimble

final class StoppedStateSpecs: QuickSpec {
    
    private var tested: StoppedState!
    private var media: PlayerMedia!
    private var mockPlayer: MockCustomPlayer!
    private var playerContext: ModernAVPlayerContext!
    private var plugin: MockPlayerPlugin!
    private var item: MockPlayerItem!
    private var delegate: MockPlayerContextDelegate!
    private var nowPlaying: MockNowPlayingService!

    override func spec() {

        beforeEach {
            self.nowPlaying = MockNowPlayingService()
            self.item = MockPlayerItem.createOne(url: "foo")
            self.media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.plugin = MockPlayerPlugin()
            self.mockPlayer = MockCustomPlayer(overrideCurrentItem: self.item)
            self.mockPlayer.seekCompletionHandlerReturn = true
            self.delegate = MockPlayerContextDelegate()
            self.playerContext = ModernAVPlayerContext(player: self.mockPlayer,
                                                       config: ModernAVPlayerConfiguration(),
                                                       nowPlaying: self.nowPlaying,
                                                       audioSession: MockAudioSession(),
                                                       plugins: [self.plugin])
            self.playerContext.delegate = self.delegate
            self.playerContext.currentMedia = self.media
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
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(1))
                expect(self.mockPlayer.seekCompletionLastParam).to(equal(kCMTimeZero))
            }

            it("should set nowPlaying time parameter to 0") {

                // ASSERT
                expect(self.nowPlaying.overrideInfoCenterCallCount).to(equal(1))
                expect(self.nowPlaying.overrideInfoCenterLastValueParam as? NSNumber)
                    .to(equal(NSNumber(value: 0)))
                expect(self.nowPlaying.overrideInfoCenterLastKeyParam)
                    .to(equal(MPNowPlayingInfoPropertyElapsedPlaybackTime))
            }
            
            it("should call didCurrentTimeChange delegate method") {
                
                // ASSERT
                expect(self.delegate.didCurrentTimeChangeCallCount).to(equal(1))
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
            context("when player status is readyToPlay") {
                beforeEach {
                    // ARRANGE
                    self.item.overrideStatus = .readyToPlay

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

            context("when item status is unknow") {
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
                    self.item.overrideStatus = .unknown
                    
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
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(2))
                expect(self.mockPlayer.seekCompletionLastParam?.seconds).to(equal(42))
            }
            
            it("should not update state context") {
                
                // ASSERT
                expect(self.playerContext.state).to(beAnInstanceOf(StoppedState.self))
            }
            
            it("should call didCurrentTimeChange delegate method") {
                
                // ASSERT
                expect(self.delegate.didCurrentTimeChangeCallCount).to(equal(2))
            }
        }
    }
}
