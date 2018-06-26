//
//  MockPlayerMediaMetadata.swift
//  ModernAVPlayer_Tests
//
//  Created by raphael ankierman on 27/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

struct MockPlayerMediaMetadata: PlayerMediaMetadata {
    let title: String?
    let albumTitle: String?
    let artist: String?
    let localPlaceHolderImageName: String?
    let remoteImageUrl: URL?
}
