//
//  PlayingStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
import Quick
import ModernAVPlayer
import Nimble

final class PlayingStateSpecs: QuickSpec {

    var media: PlayerMedia!
    var playingState: PlayingState!
    let tested = ConcretePlayerContext()

    override func spec() {

        beforeEach {
            self.media = ConcretePlayerMedia(url: URL(string: "foo")!, type: .clip)
            self.playingState = PlayingState(context: self.tested)
            self.tested.state = self.playingState
        }

        context("loadMedia") {
            it("should update state context to LoadingMedia") {

                // ACT
                self.playingState.loadMedia(media: self.media, shouldPlaying: false)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }

        context("pause") {
            it("should update state context to Paused") {

                // ACT
                self.playingState.pause()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("stop") {
            it("should update state context to Stopped") {

                // ACT
                self.playingState.stop()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }

        context("play") {
            it("should not update state context") {

                // ACT
                self.playingState.play()

                // ASSERT
                expect(self.tested.state).to(beIdenticalTo(self.playingState))
            }
        }

        context("seek") {
            it("should update state to buffering") {

                //ARRANGE
                let position: Double = 42

                // ACT
                self.playingState.seek(position: position)

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(BufferingState.self))
            }
        }
    }
}
