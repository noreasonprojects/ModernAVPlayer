//
//  PlayerMedia.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 24/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

public protocol PlayerMedia {
    var url: URL { get }
    var type: MediaType { get }
    var title: String? { get }
    var artist: String? { get }
    var albumTitle: String? { get }
    var localPlaceHolderImageName: String? { get }
    var remoteImageUrl: URL? { get }

    func isLive() -> Bool
}

public extension PlayerMedia {
    func isLive() -> Bool {
        guard case let MediaType.stream(isLive) = type, isLive
            else { return false }
        return true
    }
}

public struct ConcretePlayerMedia: PlayerMedia, Equatable {
    public let url: URL
    public let type: MediaType
    public let title: String?
    public let albumTitle: String?
    public let artist: String?
    public let localPlaceHolderImageName: String?
    public let remoteImageUrl: URL?

    public init(url: URL, type: MediaType, title: String? = nil, albumTitle: String? = nil,
                artist: String? = nil, localImageName: String? = nil, remoteImageUrl: URL? = nil) {
        self.url = url
        self.type = type
        self.title = title
        self.albumTitle = albumTitle
        self.artist = artist
        self.localPlaceHolderImageName = localImageName
        self.remoteImageUrl = remoteImageUrl
    }
}

public func == (lhs: ConcretePlayerMedia, rhs: ConcretePlayerMedia) -> Bool {
    return lhs.url.absoluteString == rhs.url.absoluteString
}
