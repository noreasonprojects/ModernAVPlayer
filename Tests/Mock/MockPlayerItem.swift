//
//  MockPlayerItem.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation

final class MockPlayerItem: AVPlayerItem {

    var overrideStatus: AVPlayerItemStatus?
    override var status: AVPlayerItemStatus {
        return overrideStatus ?? AVPlayerItemStatus.unknown
    }
    
    private(set) var cancelPendingSeeksCallCount = 0
    override func cancelPendingSeeks() {
        cancelPendingSeeksCallCount += 1
    }
}

extension MockPlayerItem {
    
    static func createOne(url: String) -> MockPlayerItem {
        let url = URL(string: url)!
        return MockPlayerItem(url: url)
    }
    
    static func createOnUsingAsset(url: String) -> MockPlayerItem {
        let url = URL(string: url)!
        let asset = MockAVAsset(url: url)
        return MockPlayerItem(asset: asset)
    }
}
