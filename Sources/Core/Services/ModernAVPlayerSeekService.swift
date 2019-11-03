// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// SeekService.swift
// Created by raphael ankierman on 03/05/2018.
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

//sourcery: AutoMockable
protocol SeekService {
    func boundedPosition(_ position: Double,
                         media: PlayerMedia?,
                         duration: Double?) -> (value: Double?, reason: PlayerUnavailableActionReason?)
}

struct ModernAVPlayerSeekService: SeekService {

    func boundedPosition(_ position: Double,
                         media: PlayerMedia?,
                         duration: Double?) -> (value: Double?, reason: PlayerUnavailableActionReason?) {

        guard media != nil
            else { return (nil, .loadMediaFirst) }

        guard position > 0 else { return (0, nil) }

        guard let duration = duration, duration.isNormal
            else { return (nil, .itemDurationNotSet) }

        guard position < duration
            else { return (nil, .positionExceed) }

        return (position, nil)
    }
}
