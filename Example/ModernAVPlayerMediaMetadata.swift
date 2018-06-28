//
//  ModernAVPlayerMediaMetadata.swift
//  ModernAVPlayer_Example
//
//  Created by raphael ankierman on 26/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import ModernAVPlayer

public struct ModernAVPlayerMediaMetadata: PlayerMediaMetadata & CustomTracker {
    public let title: String?
    public let albumTitle: String?
    public let artist: String?
    public let localPlaceHolderImageName: String?
    public let remoteImageUrl: URL?
    public let customAttribute: String?
    
    public init(title: String? = nil,
                albumTitle: String? = nil,
                artist: String? = nil,
                localImageName: String? = nil,
                remoteImageUrl: URL? = nil,
                customAttribute: String? = nil) {
        self.title = title
        self.albumTitle = albumTitle
        self.artist = artist
        self.localPlaceHolderImageName = localImageName
        self.remoteImageUrl = remoteImageUrl
        self.customAttribute = customAttribute
    }
}
