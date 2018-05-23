//
//  FailedStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
import Quick
import ModernAVPlayer
import Nimble

final class FailedStateSpecs: QuickSpec {
    
    private var state: FailedState!
    private var mockPlayer = MockCustomPlayer()
    private var url: URL!
    private var playerMedia = ConcretePlayerMedia(url: URL(string: "x")!, type: .clip)

    private lazy var tested = ConcretePlayerContext(player: self.mockPlayer)

    override func spec() {
        beforeEach {
            self.url = URL(string: "foo")!
            self.state = FailedState(context: self.tested, error: CustomError.itemFailedWhenLoading)
            self.tested.state = self.state
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {

                // ACT
                self.state.loadMedia(media: self.playerMedia, shouldPlaying: false)

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

