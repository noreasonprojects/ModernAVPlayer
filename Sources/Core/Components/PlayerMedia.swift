// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayerMedia.swift
// Created by raphael ankierman on 24/02/2018.
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

///
/// `PlayerMedia` is an object use to create the item for the player to
/// be used. `AVPlayerItem` used by `ModernAVPlayer` is init with an AVURLAsset.
///

// sourcery: AutoMockable
public protocol PlayerMedia: CustomStringConvertible {

    /// URL set to the AVURLAsset
    var url: URL { get }

    /// Type of the media
    var type: MediaType { get }

    /// Asset options use by AVURLAsset
    var assetOptions: [String: Any]? { get }

    /// Returns stream media isLive parameter
    func isLive() -> Bool

    func getMetadata() -> PlayerMediaMetadata?
    func setMetadata(_ metadata: PlayerMediaMetadata)
}

public extension PlayerMedia {
    var description: String {
        return "url: \(url.description) | type: \(type.description)"
    }
}

public extension PlayerMedia {
    func isLive() -> Bool {
        guard case let MediaType.stream(isLive) = type, isLive
            else { return false }
        return true
    }
}
