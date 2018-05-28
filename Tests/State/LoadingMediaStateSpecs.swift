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
@testable
import ModernAVPlayer

final class LoadingMediaStateSpecs: QuickSpec {
    
    var state: LoadingMediaState!
    var item: AVPlayerItem!
    var player: MockCustomPlayer!
    var tested: PlayerContext!
    var playerMedia = PlayerMedia(url: URL(string: "x")!, type: .clip)
    
    override func spec() {
        
        beforeEach {
            MockAudioSession.resetCallsCount()
            self.player = MockCustomPlayer.createOnUsingAsset(url: "foo")
            self.tested = PlayerContext(player: self.player, audioSessionType: MockAudioSession.self)
            self.state = LoadingMediaState(context: self.tested, media: self.playerMedia, shouldPlaying: true)
            self.tested.state = self.state
        }

        context("init") {
            it("should replace current item") {
                
                // ASSERT
                let newItemUrl = (self.player.replaceCurrentItemCallCountLastParam?.asset as? AVURLAsset)?.url
                expect(self.player.replaceCurrentItemCallCount).to(equal(2))
                expect(newItemUrl).to(equal(URL(string: "x")!))
            }
            
           it("should active audio session") {
                expect(MockAudioSession.activateCallCount).to(equal(1))
            }
        }
        
        context("loadMedia") {
            it("should not update state context") {
                
                // ACT
                self.state.loadMedia(media: self.playerMedia, shouldPlaying: true)
                
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

        context("pause") {
            it("should update state context to Paused") {

                // ACT
                self.state.pause()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(PausedState.self))
            }
        }

        context("pause") {
            it("should replace current item") {

                // ACT
                self.state.pause()

                // ASSERT
                expect(self.player.replaceCurrentItemCallCount).to(equal(3))
                expect(self.player.replaceCurrentItemCallCountLastParam).to(beNil())
            }
        }

        context("stop") {
            it("should update state context to Stopped") {

                // ACT
                self.state.stop()

                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
            }
        }
        
        context("stop") {
            it("should replace current item") {

                // ACT
                self.state.stop()

                // ASSERT
                expect(self.player.replaceCurrentItemCallCount).to(equal(3))
                expect(self.player.replaceCurrentItemCallCountLastParam).to(beNil())
            }
        }

        context("stop") {
            it("should cancel asset loading") {

                // ACT
                self.state.stop()

                // ASSERT
                let asset = self.player.overrideCurrentItem?.asset as? MockAVAsset
                expect(asset?.cancelLoadingCallCount).to(equal(1))
            }
        }
    }
}
