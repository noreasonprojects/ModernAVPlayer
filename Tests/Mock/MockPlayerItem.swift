//
//  MockPlayerItem.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

final class MockPlayerItem: AVPlayerItem {

    var overrideStatus: AVPlayerItemStatus?
    override var status: AVPlayerItemStatus {
        return overrideStatus ?? AVPlayerItemStatus.unknown
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
