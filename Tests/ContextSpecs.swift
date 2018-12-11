// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ContextSpecs.swift
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

final class ContextSpecs: QuickSpec {

    private var audioSession: AudioSessionServiceMock!
    private var tested: PlayerContext!
    private var mockState: MockPlayerState!
    private var media: MockPlayerMedia!
    private var nowPlaying: MockNowPlayingService!
    private let player = MockCustomPlayer()
    
    override func spec() {
        
        beforeEach {
            self.audioSession = AudioSessionServiceMock()
            self.nowPlaying = MockNowPlayingService()
            self.tested = ModernAVPlayerContext(player: self.player,
                                                config: ModernAVPlayerConfiguration(),
                                                nowPlaying: self.nowPlaying,
                                                audioSession: self.audioSession,
                                                plugins: [])
            self.mockState = MockPlayerState(context: self.tested)
            self.media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
        }
        
        context("init") {
            it("should have init state") {
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(InitState.self))
            }

            it("should set category") {

                // ASSERT
                Verify(self.audioSession, 1, .setCategory(.value(self.tested.config.audioSessionCategory)))
            }
        }
        
        context("pause") {
            it("should call pause state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.pause()

                // ASSERT
                expect(self.mockState.pauseCallCount).to(equal(1))
            }
        }

        context("play") {
            it("should call play state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.play()

                // ASSERT
                expect(self.mockState.playCallCount).to(equal(1))
            }
        }

        context("stop") {
            it("should call stop state") {

                // ARRANGE
                self.tested.changeState(state: self.mockState)

                // ACT
                self.tested.stop()

                // ASSERT
                expect(self.mockState.stopCallCount).to(equal(1))
            }
        }

        context("seek") {
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

        context("loadMedia") {
            it("should set current media") {

                // ARRANGE
                let media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
                
                // ACT
                self.tested.load(media: media, autostart: false, position: nil)

                // ASSERT
                expect(self.tested.currentMedia as? MockPlayerMedia).to(equal(media))
            }
            
            it("should call loadMedia state") {
                
                // ARRANGE
                self.tested.changeState(state: self.mockState)
                let media = MockPlayerMedia(url: URL(string: "foo")!, type: .clip)
                let position = 42.0

                // ACT
                self.tested.load(media: media, autostart: false, position: position)

                // ASSERT
                expect(self.mockState.loadMedialCallCount).to(equal(1))
                expect(self.mockState.lastLoadAutostartParam).to(beFalse())
                expect(self.mockState.lastLoadPositionParam).to(be(position))
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
            
            it("should call state updateContext() method") {
                
                // ARRANGE
                let newState = MockPlayerState(context: self.tested)
                
                // ACT
                self.tested.changeState(state: newState)
                
                // ASSERT
                expect(newState.contextUpdatedCallCount).to(equal(1))
            }
        }

        context("update metadata when current media is set") {
            it("should call setMetadata media method") {

                // ARRANGE
                self.tested.currentMedia = self.media
                let metadata = MockPlayerMediaMetadata(title: "title",
                                                       albumTitle: "album",
                                                       artist: "artist",
                                                       image: nil,
                                                       remoteImageUrl: nil)

                // ACT
                self.tested.updateMetadata(metadata)

                // ASSERT
                expect(self.media.setMetadataCallCount).to(equal(1))
                let m = MockPlayerMediaMetadata.convert(self.media.setMetadataLastParam!)
                expect(m).to(equal(metadata))
            }

            it("should update now playing info") {

                // ARRANGE
                self.tested.currentMedia = self.media
                let metadata = MockPlayerMediaMetadata(title: "title",
                                                       albumTitle: "album",
                                                       artist: "artist",
                                                       image: nil,
                                                       remoteImageUrl: nil)

                // ACT
                self.tested.updateMetadata(metadata)

                // ASSERT
                expect(self.nowPlaying.updateCallCount).to(equal(1))
                let expectedMetadata = MockPlayerMediaMetadata.convert(self.nowPlaying.updateLastMetadataParam!)
                expect(expectedMetadata).to(equal(metadata))
            }
        }

        context("update metadata when current media is not set") {
            it("shouldn't call media setMetadata") {

                // ARRANGE
                self.tested.currentMedia = nil
                let metadata = MockPlayerMediaMetadata(title: "title",
                                                       albumTitle: "album",
                                                       artist: "artist",
                                                       image: nil,
                                                       remoteImageUrl: nil)

                // ACT
                self.tested.updateMetadata(metadata)

                // ASSERT
                expect(self.media.setMetadataCallCount).to(equal(0))
                expect(self.media.setMetadataLastParam).to(beNil())

            }

            it("shouldn't update now pLaying") {

                // ARRANGE
                self.tested.currentMedia = nil
                let metadata = MockPlayerMediaMetadata(title: "title",
                                                       albumTitle: "album",
                                                       artist: "artist",
                                                       image: nil,
                                                       remoteImageUrl: nil)

                // ACT
                self.tested.updateMetadata(metadata)

                // ASSERT
                expect(self.nowPlaying.updateCallCount).to(equal(0))
                expect(self.nowPlaying.updateLastMetadataParam).to(beNil())
                expect(self.nowPlaying.updateLastDurationParam).to(beNil())
                expect(self.nowPlaying.updateLastIsLiveParam).to(beNil())
            }
        }
    }
}
