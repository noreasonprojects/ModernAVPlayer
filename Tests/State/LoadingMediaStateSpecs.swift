// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// LoadingMediaStateSpecs.swift
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
import Quick
@testable
import ModernAVPlayer
import Nimble
import SwiftyMocky

final class LoadingMediaStateSpecs: QuickSpec {

    private var audioSession: AudioSessionServiceMock!
    private var state: LoadingMediaState!
    private var item: AVPlayerItem!
    private var player: MockCustomPlayer!
    private var tested: ModernAVPlayerContext!
    private let playerMedia = MockPlayerMedia(url: URL(string: "x")!, type: .clip)
    private let seekPosition = 42.0
    
    override func spec() {
        
        beforeEach {
            self.audioSession = AudioSessionServiceMock()
            self.player = MockCustomPlayer.createOnUsingAsset(url: "foo")
            self.tested = ModernAVPlayerContext(player: self.player,
                                                config: ModernAVPlayerConfiguration(),
                                                audioSession: self.audioSession,
                                                plugins: [])
            self.tested.currentMedia = self.playerMedia
            self.state = LoadingMediaState(context: self.tested,
                                           media: self.playerMedia,
                                           autostart: true,
                                           position: self.seekPosition)
            self.tested.state = self.state
        }

        context("init") {
            it("should replace current item") {
                
                // ASSERT
                let newItemUrl = (self.player.replaceCurrentItemCallCountLastParam?.asset as? AVURLAsset)?.url
                expect(self.player.replaceCurrentItemCallCount).to(equal(2))
                expect(newItemUrl).to(equal(URL(string: "x")!))
            }
            
           it("should active audio session") {
                Verify(self.audioSession, 1, .activate())
            }
        }
        
        context("loadMedia") {
            it("should not update state context") {
                
                // ACT
                self.state.load(media: self.playerMedia, autostart: true)
                
                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }
        
        context("play") {
            it("should not update state context") {
                
                // ACT
                self.state.play()
                
                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }

        context("pause") {
            it("should update state context to Paused") {

                // ACT
                self.state.pause()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("pause") {
            it("should replace current item") {

                // ACT
                self.state.pause()

                // ASSERT
                expect(self.player.replaceCurrentItemCallCount).to(equal(3))
                expect(self.player.replaceCurrentItemCallCountLastParam).to(beNil())
            }
        }

        context("stop") {
            it("should update state context to Stopped") {

                // ACT
                self.state.stop()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }
        
        context("stop") {
            it("should replace current item") {

                // ACT
                self.state.stop()

                // ASSERT
                expect(self.player.replaceCurrentItemCallCount).to(equal(3))
                expect(self.player.replaceCurrentItemCallCountLastParam).to(beNil())
            }
        }

        context("stop") {
            it("should cancel asset loading") {

                // ACT
                self.state.stop()

                // ASSERT
                let asset = self.player.overrideCurrentItem?.asset as? MockAVAsset
                expect(asset?.cancelLoadingCallCount).to(equal(1))
            }
        }
        
        context("seek") {
            it("should not update state context") {
                
                // ACT
                self.state.seek(position: 42)
                
                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }
    }
}
