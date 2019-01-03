// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// InitStateSpecs.swift
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
import SwiftyMocky

final class InitStateSpecs: QuickSpec {

    private var state: PlayerState!
    private var tested: ModernAVPlayerContext!
    private let player = MockCustomPlayer()
    private let media = MockPlayerMedia(url: URL(string: "foo")!, type: .stream(isLive: false))

    override func spec() {

        beforeEach {
            self.tested = ModernAVPlayerContext(player: self.player,
                                                config: ModernAVPlayerConfiguration(),
                                                plugins: [])
            self.tested.currentMedia = self.media
            self.state = self.tested.state
        }

        context("pause") {
            it("should update state context to pause") {

                // ACT
                self.state.pause()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("stop") {
            it("should update state context to stop") {

                // ACT
                self.state.stop()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }

        context("loadMedia") {
            it("should update state context to loadingMedia") {

                // ACT
                self.state.load(media: self.media, autostart: true, position: nil)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("play") {
            it("should not update state context") {

                // ACT
                self.state.play()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(InitState.self))
            }
        }

        context("seek") {
            it("should not update state context") {

                // ACT
                self.state.seek(position: 42)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(InitState.self))
            }
        }
    }
}
