//
//  ModernAVPlayerMedia.swift
//  ModernAVPlayer_Example
//
//  Created by raphael ankierman on 26/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import ModernAVPlayer

public struct ModernAVPlayerMedia: PlayerMedia {
    public let url: URL
    public let type: MediaType
    public let headerFields: [String: Any]?
    public let metadata: ModernAVPlayerMediaMetadata?

    init(url: URL, type: MediaType, headerFields: [String: Any]? = nil, metadata: ModernAVPlayerMediaMetadata?) {
        self.url = url
        self.type = type
        self.headerFields = headerFields
        self.metadata = metadata
    }
    
    public func getMetadata() -> PlayerMediaMetadata? {
        return metadata
    }
}
