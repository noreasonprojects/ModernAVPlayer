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

public protocol PlayerMedia: CustomStringConvertible {
    var url: URL { get }
    var type: MediaType { get }
    var metadata: PlayerMediaMetadata? { get }
    
    func isLive() -> Bool
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

public struct ModernAVPlayerMedia: PlayerMedia, Equatable {
    public let url: URL
    public let type: MediaType
    public let metadata: PlayerMediaMetadata?
    
    public init(url: URL, type: MediaType, metadata: PlayerMediaMetadata? = nil) {
        self.url = url
        self.type = type
        self.metadata = metadata
    }
    
    public init(url: URL,
                type: MediaType,
                title: String? = nil,
                albumTitle: String? = nil,
                artist: String? = nil,
                localImageName: String? = nil,
                remoteImageUrl: URL? = nil) {
        let metadata = ModernAVPlayerMediaMetadata(title: title,
                                                   albumTitle: albumTitle,
                                                   artist: artist,
                                                   localImageName: localImageName,
                                                   remoteImageUrl: remoteImageUrl)
        self.init(url: url, type: type, metadata: metadata)
    }
}

public func == (lhs: ModernAVPlayerMedia, rhs: ModernAVPlayerMedia) -> Bool {
    return lhs.url.absoluteString == rhs.url.absoluteString
}
