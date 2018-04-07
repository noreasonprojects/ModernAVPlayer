//
//  LoadingMediaStateSpecs.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation
import Quick
import Nimble
import ModernAVPlayer

final class LoadingMediaStateSpecs: QuickSpec {
    
//    var state: LoadingMediaState!
//    var item: MockPlayerItem!
//    var player: MockCutomPlayer!
//    let tested = MockPlayerContext()
//    
//    override func spec() {
//        
//        beforeEach {
//            self.item = MockPlayerItem.createOne(url: "foo")
//            self.player = MockCutomPlayer()
//            self.tested.player = self.player
//            self.state = LoadingMediaState(context: self.tested, item: self.item)
//            self.tested.state = self.state
//        }
//
//        context("init") {
//            it("should pause the player") {
//
//                // ASSERT
//                expect(self.player.pauseCallCount).to(equal(1))
//            }
//
//            it("should replace current item") {
//                
//                // ASSERT
//                expect(self.player.replaceCurrentItemCallCount).to(equal(1))
//                expect(self.player.replaceCurrentItemCallCountLastParam).to(beIdenticalTo(self.item))
//            }
//        }
//        
//        context("loadMedia") {
//            it("should not update state context") {
//                
//                // ACT
//                self.state.loadMedia()
//                
//                // ASSERT
//                expect(self.tested.state).to(beIdenticalTo(self.state))
//            }
//        }
//        
//        context("play") {
//            it("should not update state context") {
//                
//                // ACT
//                self.state.play()
//                
//                // ASSERT
//                expect(self.tested.state).to(beIdenticalTo(self.state))
//            }
//        }
//
//        context("pause") {
//            it("should update state context to Paused") {
//
//                // ACT
//                self.state.pause()
//
//                // ASSERT
//                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
//            }
//        }
//
//        context("pause") {
//            it("should replace current item") {
//
//                // ACT
//                self.state.pause()
//
//                // ASSERT
//                expect(self.player.replaceCurrentItemCallCount).to(equal(2))
//                expect(self.player.replaceCurrentItemCallCountLastParam).to(beNil())
//            }
//        }
//
//        context("stop") {
//            it("should update state context to Stopped") {
//
//                // ACT
//                self.state.stop()
//
//                // ASSERT
//                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
//            }
//        }
//        
//        context("stop") {
//            it("should replace current item") {
//
//                // ACT
//                self.state.stop()
//
//                // ASSERT
//                expect(self.player.replaceCurrentItemCallCount).to(equal(2))
//                expect(self.player.replaceCurrentItemCallCountLastParam).to(beNil())
//            }
//        }
//
//        context("stop") {
//            it("should cancel asset loading") {
//
//                // ARRANGE
//                let item = MockPlayerItem.createOnUsingAsset(url: "foo")
//                self.player.overrideCurrentItem = item
//
//                // ACT
//                self.state.stop()
//
//                // ASSERT
//                let asset = self.item.asset as? MockAVAsset
//                expect(asset?.cancelLoadingCallCount).to(equal(1))
//            }
//        }
//    }
}
