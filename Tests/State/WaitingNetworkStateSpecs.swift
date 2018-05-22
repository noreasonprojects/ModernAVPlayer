//
//  WaitingNetworkStateSpecs.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 22/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import ModernAVPlayer
import Nimble

final class WaitingNetworkStateSpecs: QuickSpec {
    
    private var state: WaitingNetworkState!
    private var mockPlayer = MockCustomPlayer()
    private var url: URL!
    private var playerMedia = ConcretePlayerMedia(url: URL(string: "x")!, type: .clip)
    private var mockReachability: MockReachability!
    private lazy var tested = ConcretePlayerContext(player: self.mockPlayer)
    
    override func spec() {
        beforeEach {
            self.mockReachability = MockReachability()
            self.url = URL(string: "foo")!
            self.state = WaitingNetworkState(context: self.tested,
                                             urlToReload: self.url,
                                             shouldPlaying: true,
                                             error: CustomError.itemFailedWhenLoading,
                                             reachabilityService: self.mockReachability)
            self.tested.state = self.state
        }
        
        context("init") {
            it("should start reachability service") {
                
                // ASSERT
                expect(self.mockReachability.start_callCount).to(equal(1))
            }
            
            it("should setup isTimedOut callback") {
            
                // ACT
                self.mockReachability.isTimedOut?()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(FailedState.self))
            }
            
            it("should setup isReachable callback") {
                
                // ACT
                self.mockReachability.isReachable?(true)
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
            }
        }
        
        context("loadMedia") {
            it("should update state context to LoadingMedia") {
                
                // ACT
                self.state.loadMedia(media: self.playerMedia, shouldPlaying: false)
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(LoadingMediaState.self))
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
        
        context("stop") {
            it("should update state context to Stopped") {
                
                // ACT
                self.state.stop()
                
                // ASSERT
                expect(self.tested.state).to(beAnInstanceOf(StoppedState.self))
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
    }
}
