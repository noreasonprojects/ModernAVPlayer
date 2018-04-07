//
//  MockCustomPlayer.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation
import Quick
import Nimble

final class MockCutomPlayer: AVPlayer {

    var overrideCurrentItem: AVPlayerItem?
    override var currentItem: AVPlayerItem? {
        return overrideCurrentItem
    }

    var overrideStatus = AVPlayerStatus.unknown
    override var status: AVPlayerStatus {
        return overrideStatus
    }
    
    var pauseCallCount = 0
    override func pause() {
        pauseCallCount += 1
    }
    
    var playCallCount = 0
    override func play() {
        playCallCount += 1
    }
    
    var seekCallCount = 0
    var lastSeekParam: CMTime?
    override func seek(to time: CMTime) {
        seekCallCount += 1
        lastSeekParam = time
    }
    
    var replaceCurrentItemCallCount = 0
    var replaceCurrentItemCallCountLastParam: AVPlayerItem?
    override func replaceCurrentItem(with item: AVPlayerItem?) {
        replaceCurrentItemCallCount += 1
        replaceCurrentItemCallCountLastParam = item
    }

    var addObserverCallCount = 0
    var addObserverLastKeyPathParam: String?
    override func addObserver(_ observer: NSObject, forKeyPath keyPath: String, options: NSKeyValueObservingOptions = [], context: UnsafeMutableRawPointer?) {
        addObserverCallCount += 1
        addObserverLastKeyPathParam = keyPath
    }

    override func removeObserver(_ observer: NSObject, forKeyPath keyPath: String) {
        
    }
}
