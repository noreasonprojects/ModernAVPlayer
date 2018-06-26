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
    public let metadata: ModernAVPlayerMediaMetadata?
    
    public func getMetadata() -> PlayerMediaMetadata? {
        return metadata
    }
}
