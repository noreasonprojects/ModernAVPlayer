//
//  LoadedStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ModernAVPlayer

final class LoadedStateSpecs: QuickSpec {
    
    private var loadedState: LoadedState!
    private var mockPlayer: MockCustomPlayer!
    private var playerMedia = ConcretePlayerMedia(url: URL(string: "x")!, type: .clip)
    lazy var tested = ConcretePlayerContext(player: self.mockPlayer, audioSessionType: MockAudioSession.self)
    
    override func spec() {
        
        beforeEach {
            self.mockPlayer = MockCustomPlayer()
            self.loadedState = LoadedState(context: self.tested)
            self.tested.state = self.loadedState
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {

                // ACT
                self.loadedState.loadMedia(media: self.playerMedia, shouldPlaying: false)

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

/* Wait for exporting observingRate service */
        
//        context("play") {
//            it("should ask the player to play") {
//
//                // ACT
//                self.loadedState.play()
//                MockAudioSession.activeLastCompletion?(true)
//
//                // ASSERT
//                guard let player = self.tested.player as? MockCustomPlayer
//                    else { fail(); return }
//
//                expect(player.playCallCount).to(equal(1))
//            }
//        }

        context("play") {
            it("should update state context to Buffering") {

                // ACT
                self.loadedState.play()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(BufferingState.self))
            }
        }
    }
}
