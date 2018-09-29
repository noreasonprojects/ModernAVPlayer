//
//  PlayerMediaSpecs.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 29/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
@testable
import ModernAVPlayer
import XCTest

final class PlayerMediaSpecs: XCTestCase {

    private var media: ModernAVPlayerMedia!

    override func setUp() {
        let url = URL(string: "foo")!
        media = ModernAVPlayerMedia(url: url, type: .clip, metadata: nil)
    }

    func testSetMetadata() {
        // ARRANGE
        let newMetadata = ModernAVPlayerMediaMetadata(title: "foo")

        // ACT
        media.setMetadata(newMetadata)

        // ASSERT
        expect(self.media.metadata).to(equal(newMetadata))
    }

    func testGetMetadata() {
        // ARRANGE
        let newMetadata = ModernAVPlayerMediaMetadata(title: "foo")
        media.metadata = newMetadata

        // ACT
        let expectedMetadata = media.getMetadata() as? ModernAVPlayerMediaMetadata

        // ASSERT
        expect(expectedMetadata).to(equal(newMetadata))
    }
}
