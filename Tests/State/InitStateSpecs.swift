//
//  InitStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
import Quick
@testable
import ModernAVPlayer
import Nimble

final class InitStateSpecs: QuickSpec {

    var state: InitState!
    let tested = PlayerContext()
    let media = ConcretePlayerMedia(url: URL(string: "foo")!, type: .stream(isLive: false))

    override func spec() {

        beforeEach {
            self.state = InitState(context: self.tested)
            self.tested.state = self.state
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
                self.state.loadMedia(media: self.media, shouldPlaying: true)

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
