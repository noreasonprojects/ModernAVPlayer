//
//  MockPlayerMedia.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 27/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

final class MockPlayerMedia: PlayerMedia, Equatable {

    let url: URL
    let type: MediaType
    let assetOptions: [String: Any]?
    let metadata: MockPlayerMediaMetadata?
    
    init(url: URL, type: MediaType, assetOptions: [String: Any]? = nil, metadata: MockPlayerMediaMetadata? = nil) {
        self.url = url
        self.type = type
        self.assetOptions = assetOptions
        self.metadata = metadata
    }
    
    func getMetadata() -> PlayerMediaMetadata? {
        return metadata
    }

    private(set) var setMetadataCallCount = 0
    private(set) var setMetadataLastParam: PlayerMediaMetadata?
    func setMetadata(_ metadata: PlayerMediaMetadata) {
        setMetadataCallCount += 1
        setMetadataLastParam = metadata
    }
}

func == (lhs: MockPlayerMedia, rhs: MockPlayerMedia) -> Bool {
    return lhs.url == rhs.url
}
