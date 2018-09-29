//
//  MockNowPlayingService.swift
//  ModernAVPlayer_Tests
//
//  Created by ankierman on 02/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable
import ModernAVPlayer

final class MockNowPlayingService: NowPlaying {

    private(set) var updateCallCount = 0
    private(set) var updateLastMetadataParam: PlayerMediaMetadata?
    private(set) var updateLastDurationParam: Double?
    private(set) var updateLastIsLiveParam: Bool?
    func update(metadata: PlayerMediaMetadata?, duration: Double?, isLive: Bool?) {
        updateCallCount += 1
        updateLastMetadataParam = metadata
        updateLastDurationParam = duration
        updateLastIsLiveParam = isLive
    }

    private(set) var overrideInfoCenterCallCount = 0
    private(set) var overrideInfoCenterLastKeyParam: String?
    private(set) var overrideInfoCenterLastValueParam: Any?
    func overrideInfoCenter(for key: String, value: Any) {
        overrideInfoCenterCallCount += 1
        overrideInfoCenterLastKeyParam = key
        overrideInfoCenterLastValueParam = value
    }
}
