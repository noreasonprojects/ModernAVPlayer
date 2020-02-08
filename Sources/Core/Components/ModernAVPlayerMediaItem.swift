// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// ModernAVPlayerMediaItem.swift
// Created by raphael ankierman on 17/11/2019.
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

import AVFoundation.AVPlayerItem

public class ModernAVPlayerMediaItem: PlayerMediaItem {

    // MARK: - Outputs

    public let item: AVPlayerItem
    public let url: URL
    public let type: MediaType
    public let assetOptions: [String: Any]?

    // MARK: - Input

    private var metadata: ModernAVPlayerMediaMetadata?

    // MARK: - Init

    public init?(item: AVPlayerItem,
                 type: MediaType,
                 metadata: ModernAVPlayerMediaMetadata? = nil,
                 assetOptions: [String: Any]? = nil) {
        self.item = item
        self.type = type
        self.metadata = metadata
        self.assetOptions = assetOptions

        guard let url = (item.asset as? AVURLAsset)?.url else { return nil }
        self.url = url
    }

    // MARK: - Metadata

    public func getMetadata() -> PlayerMediaMetadata? {
        return metadata
    }

    public func setMetadata(_ metadata: PlayerMediaMetadata) {
        self.metadata = metadata as? ModernAVPlayerMediaMetadata
    }
}
