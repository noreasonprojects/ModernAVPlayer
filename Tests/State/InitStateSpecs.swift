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

    private var state: PlayerState!
    private var tested: PlayerContext!
    private var plugin: MockPlayerPlugin!
    private let media = ModernAVPlayerMedia(url: URL(string: "foo")!, type: .stream(isLive: false))

    override func spec() {

        beforeEach {
            self.plugin = MockPlayerPlugin()
            self.tested = ModernAVPlayerContext(plugins: [self.plugin])
            self.state = self.tested.state
        }
        
        context("init") {
            it("should execute didInit plugin method") {
                
                // ASSERT
                expect(self.plugin.didInitLastParam).to(beIdenticalTo(self.tested.player))
                expect(self.plugin.didInitCallCount).to(equal(1))
            }
            
            it("should not execute didLoad plugin method") {
                
                // ASSERT
                expect(self.plugin.didLoadmediaCallCount).to(equal(0))
            }
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
