//
//  PlayerMediaSpecs.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 29/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable
import ModernAVPlayer
import XCTest

final class PlayerMediaSpecs: XCTestCase {

    private let url = URL(string: "foo")!

    func testSetMetadata() {
        // ARRANGE
        let media = ModernAVPlayerMedia(url: url, type: .stream(isLive: false), metadata: nil)
        let newMetadata = ModernAVPlayerMediaMetadata(title: "foo")

        // ACT
        media.setMetadata(newMetadata)
        let expected = media.getMetadata() as? ModernAVPlayerMediaMetadata

        // ASSERT
        XCTAssertEqual(expected, newMetadata)
    }

    func testGetMetadataNil() {
        // ARRANGE
        let media = ModernAVPlayerMedia(url: url, type: .stream(isLive: false), metadata: nil)

        // ACT
        let expectedMetadata = media.getMetadata() as? ModernAVPlayerMediaMetadata

        // ASSERT
        XCTAssertNil(expectedMetadata)
    }

    func testTypeNotLiveStream() {
        // ARRANGE
        let media = ModernAVPlayerMedia(url: url, type: .stream(isLive: false), metadata: nil)

        // ASSERT
        XCTAssertFalse(media.isLive())
    }

    func testTypetLiveStream() {
        // ARRANGE
        let media = ModernAVPlayerMedia(url: url, type: .stream(isLive: true), metadata: nil)

        // ASSERT
        XCTAssertTrue(media.isLive())
    }

    func testTypeClip() {
        // ARRANGE
        let media = ModernAVPlayerMedia(url: url, type: .clip, metadata: nil)

        // ASSERT
        XCTAssertFalse(media.isLive())
    }

    func testOutputDescription() {
        // ARRANGE
        let type = MediaType.clip
        let media = ModernAVPlayerMedia(url: url, type: type, metadata: nil)

        // ASSERT
        XCTAssertEqual(media.description, "url: \(url.absoluteString) | type: \(type.description)")
    }
}
