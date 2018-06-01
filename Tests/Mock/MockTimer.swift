// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// MockTimer.swift
// Created by raphael ankierman on 30/04/2018.
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
import Foundation
import Quick
@testable
import ModernAVPlayer
import Nimble

final class MockTimer: CustomTimer {
    
    var fire_CallCount = 0
    func fire() {
        fire_CallCount += 1
    }
    
    var invalidate_CallCount = 0
    func invalidate() {
        invalidate_CallCount += 1
    }
}

final class MockTimerFactory: TimerFactory {
    
    var lastCompletion: (() -> Void)?
    var timer =  MockTimer()
    func getTimer(timeInterval: TimeInterval, repeats: Bool, block: @escaping () -> Void) -> CustomTimer {
        lastCompletion = block
        return timer
    }
}

