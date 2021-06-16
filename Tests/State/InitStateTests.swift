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

import AVFoundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class InitStateTests: XCTestCase {
    
    private var context: PlayerContextMock!
    private var contextDelegate: PlayerContextDelegateMock!
    private var state: InitState!
    private var player: MockCustomPlayer!
    
    override func setUp() {
        ModernAVPlayerLogger.setup.domains = []
        player = MockCustomPlayer()
        context = PlayerContextMock()
        contextDelegate = PlayerContextDelegateMock()
        
        Given(context, .player(getter: player))
        Given(context, .delegate(getter: contextDelegate))
        
        state = InitState(context: context)
    }

    func testContextUpdatedCall() {
        // ACT
        state.contextUpdated()
        
        // ASSERT
        XCTAssertEqual(player.automaticallyWaitsToMinimizeStallingNewValue, false)
    }
    
    func testPauseCall() {
        // ACT
        state.pause()
        
        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is PausedState }))
    }
    
    func testStopCall() {
        // ARRANGE
        Given(context, .config(getter: ModernAVPlayerConfiguration()))
        
        // ACT
        state.stop()
        
        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is StoppedState }))
    }
    
    func testLoadMediaCall() {
        // ARRANGE
        Given(context, .audioSession(getter: ModernAVPlayerAudioSessionService()))
        let media = PlayerMediaMock()
        
        // ACT
        state.load(media: media, autostart: false)
        
        // ASSERT
        Verify(context, 1, .changeState(state: .matching { $0 is LoadingMediaState }))
    }
    
    func testPlayCall() {
        // ACT
        state.play()
        
        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }
    
    func testSeekCall() {
        // ACT
        state.seek(position: 42, isAccurate: false)
        
        // ASSERT
        Verify(contextDelegate, 1, .playerContext(unavailableActionReason: .value(.loadMediaFirst)))
    }
}
