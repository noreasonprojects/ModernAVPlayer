// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ModernAVPlayerLoggerDomain.swift
// Created by raphael ankierman on 26/07/2018.
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

import Foundation

public enum ModernAVPlayerLoggerDomain: CustomStringConvertible {
    case state
    case service
    case error
    case lifecycleService
    case lifecycleState
    case remoteCommand
    case unavailableCommand
    
    public var description: String {
        switch self {
        case .error:
            return "[💉]"
        case .service:
            return "[🔬]"
        case .lifecycleService:
            return "[🔬 🚥]"
        case .state:
            return "[🔈]"
        case .lifecycleState:
            return "[🔈 🚥]"
        case .remoteCommand:
            return "[▶️]"
        case .unavailableCommand:
            return "[🙅‍♂️]"
        }
    }
}
