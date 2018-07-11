// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// LoadedStateSpecs.swift
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
import Quick
import Nimble
@testable
import ModernAVPlayer

final class LoadedStateSpecs: QuickSpec {
    
    private var loadedState: PlayerState!
    private var mockPlayer: MockCustomPlayer!
    private let playerMedia = MockPlayerMedia(url: URL(string: "x")!, type: .clip)
    private var tested: ModernAVPlayerContext!
    private let plugins = [MockPlayerPlugin(), MockPlayerPlugin()]
    
    override func spec() {
        
        beforeEach {
            self.mockPlayer = MockCustomPlayer.createOne(url: "foo")
            self.tested = ModernAVPlayerContext(player: self.mockPlayer, audioSessionType: MockAudioSession.self, plugins: self.plugins)
            self.tested.currentMedia = self.playerMedia
            self.tested.itemDuration = 42
            self.loadedState = LoadedState(context: self.tested)
            self.tested.state = self.loadedState
        }
        
        context("init") {
            it("should execute didLoad plugin method") {
                
                // ASSERT
                expect(self.plugins[0].didLoadCallCount).to(equal(1))
                expect(self.plugins[0].didLoadLastMediaParam).to(equal(self.playerMedia))
                expect(self.plugins[0].didLoadLastDurationParam).to(equal(42))
                
                expect(self.plugins[1].didLoadCallCount).to(equal(1))
                expect(self.plugins[1].didLoadLastMediaParam).to(equal(self.playerMedia))
                expect(self.plugins[1].didLoadLastDurationParam).to(equal(42))
            }
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {
                
                // ACT
                self.loadedState.load(media: self.playerMedia, autostart: false, position: nil)
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }
        
        context("pause") {
            it("should update state context to Paused") {
                
                // ACT
                self.loadedState.pause()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }
        
        context("stop") {
            it("should update state context to Stopped") {
                
                // ACT
                self.loadedState.stop()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }
        
        context("play") {
            it("should ask the player to play") {
                
                // ACT
                self.loadedState.play()
                
                // ASSERT
                guard let player = self.tested.player as? MockCustomPlayer
                    else { fail(); return }
                
                expect(player.playCallCount).to(equal(1))
            }
        
            it("should update state context to Buffering") {
            
                // ACT
                self.loadedState.play()
            
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(BufferingState.self))
            }
        }
        
        context("seek") {
            it("should call seek on player") {
                let position: Double = 42
                
                // ACT
                self.loadedState.seek(position: position)
                
                // ASSERT
                expect(self.mockPlayer.seekCompletionCallCount).to(equal(1))
            }
            
            context("seek completion failed") {
                it("should not update context current time") {
                    let position: Double = 42
                    
                    // ACT
                    self.loadedState.seek(position: position)
                    self.mockPlayer.lastCompletionParam?(false)
                    
                    // ASSERT
                    expect(self.tested.currentTime).to(equal(0))
                }
            }
            
            context("seek completion succeed") {
                it("should update context current time") {
                    let position: Double = 42
                    
                    // ACT
                    self.loadedState.seek(position: position)
                    self.mockPlayer.lastCompletionParam?(true)
                    
                    // ASSERT
                    expect(self.tested.currentTime).to(equal(position))
                }
            }
        }
    }
}
