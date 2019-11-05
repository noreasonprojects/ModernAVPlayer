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

import AVFoundation
import Foundation

//sourcery: AutoMockable
protocol SeekService {
    func boundedPosition(_ position: Double,
                         item: AVPlayerItem) -> (value: Double?, reason: PlayerUnavailableActionReason?)
}

struct ModernAVPlayerSeekService: SeekService {

    private let preferredTimescale: CMTimeScale

    init(preferredTimescale: CMTimeScale) {
        self.preferredTimescale = preferredTimescale
    }

    private func isPositionInRanges(_ position: Double, _ ranges: [CMTimeRange]) -> Bool {
        let time = CMTime(seconds: position, preferredTimescale: preferredTimescale)
        return !ranges.filter { $0.containsTime(time) }.isEmpty
    }

    private func getItemRangesAvailable(_ item: AVPlayerItem) -> [CMTimeRange] {
        let ranges = item.seekableTimeRanges + item.loadedTimeRanges
        return ranges.map { $0.timeRangeValue }
    }

    func boundedPosition(_ position: Double,
                         item: AVPlayerItem) -> (value: Double?, reason: PlayerUnavailableActionReason?) {

        guard position > 0 else { return (0, nil) }

        let duration = item.duration.seconds
        guard duration.isNormal else {
            let ranges = getItemRangesAvailable(item)
            return isPositionInRanges(position, ranges) ? (position, nil) : (nil, .seekPositionNotAvailable)
        }

        guard position < duration
            else { return (nil, .seekOverstepPosition) }

        return (position, nil)
    }
}
