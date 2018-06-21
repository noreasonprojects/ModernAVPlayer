// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// FailedStateSpecs.swift
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
@testable
import ModernAVPlayer
import Nimble

final class FailedStateSpecs: QuickSpec {
    
    private var state: FailedState!
    private var mockPlayer = MockCustomPlayer()
    private var url: URL!
    private var plugin: MockPlayerPlugin!
    private var playerMedia = ModernAVPlayerMedia(url: URL(string: "x")!, type: .clip)
    private var tested: ModernAVPlayerContext!

    override func spec() {
        beforeEach {
            self.plugin = MockPlayerPlugin()
            self.url = URL(string: "foo")!
            self.tested = ModernAVPlayerContext(player: self.mockPlayer, plugins: [self.plugin])
            self.state = FailedState(context: self.tested, error: PlayerError.itemFailedWhenLoading)
            self.tested.state = self.state
        }
        
        context("init") {
            it("should execute plugin method") {
                
                // ASSERT
                expect(self.plugin.didFailedCallCount).to(equal(1))
            }
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {

                // ACT
                self.state.loadMedia(media: self.playerMedia, autostart: false)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("stop") {
            it("should not update state context") {

                // ACT
                self.state.stop()

                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }

        context("pause") {
            it("should not update state context") {

                // ACT
                self.state.pause()

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
        
        context("seek") {
            it("should not update state context") {
                
                // ACT
                self.state.seek(position: 0)
                
                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.state))
            }
        }
    }
}

