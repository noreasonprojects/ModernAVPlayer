//
//  MockPlayerMedia.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 27/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

struct MockPlayerMedia: PlayerMedia, Equatable {
    let url: URL
    let type: MediaType
    let metadata: MockPlayerMediaMetadata?
    
    init(url: URL, type: MediaType, metadata: MockPlayerMediaMetadata? = nil) {
        self.url = url
        self.type = type
        self.metadata = metadata
    }
    
    func getMetadata() -> PlayerMediaMetadata? {
        return metadata
    }
}

func == (lhs: MockPlayerMedia, rhs: MockPlayerMedia) -> Bool {
    return lhs.url == rhs.url
}
