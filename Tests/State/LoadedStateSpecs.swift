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
    
//    var loadedState: LoadedState!
//    let tested = ConcretePlayerContext()
//    
//    override func spec() {
//        
//        beforeEach {
//            self.loadedState = LoadedState(context: self.tested)
//            self.tested.state = self.loadedState
//            self.tested.player = MockCutomPlayer()
//        }
//        
//        context("loadMedia") {
//            it("should update state context to LoadingMedia") {
//                
//                // ACT
//                self.loadedState.loadMedia()
//                
//                // ASSERT
//                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
//            }
//        }
//        
//        context("pause") {
//            it("should update state context to Paused") {
//                
//                // ACT
//                self.loadedState.pause()
//                
//                // ASSERT
//                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
//            }
//        }
//        
//        context("stop") {
//            it("should update state context to Stopped") {
//                
//                // ACT
//                self.loadedState.stop()
//                
//                // ASSERT
//                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
//            }
//        }
//
//        context("play") {
//            it("should ask the player to play") {
//
//                // ACT
//                self.loadedState.play()
//
//                // ASSERT
//                guard let player = self.tested.player as? MockCutomPlayer
//                    else { fail(); return }
//                
//                expect(player.playCallCount).to(equal(1))
//            }
//        }
//
//        context("play") {
//            it("should update state context to Buffering") {
//
//                // ACT
//                self.loadedState.play()
//                
//                // ASSERT
//                expect(self.tested.state).to(beAnInstanceOf(BufferingState.self))
//            }
//        }
//    }
}
