//
//  MockAVAsset.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

final class MockAVAsset: AVURLAsset {
    
    var cancelLoadingCallCount = 0
    override func cancelLoading() {
        cancelLoadingCallCount += 1
    }
}
