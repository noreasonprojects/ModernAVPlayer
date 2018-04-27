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

final class MockCustomPlayer: AVPlayer {

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
    
    var seekCompletionCallCount = 0
    var lastSeekCompletionParam: CMTime?
    var lastCompletionParam: ((Bool) -> Void)?
    override func seek(to time: CMTime, completionHandler: @escaping (Bool) -> Void) {
        seekCompletionCallCount += 1
        lastSeekCompletionParam = time
        lastCompletionParam = completionHandler
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
    
    static func createOne(url: String) -> MockCustomPlayer {
        let player = MockCustomPlayer()
        player.overrideCurrentItem = MockPlayerItem.createOne(url: url)
        return player
    }
    
    static func createOnUsingAsset(url: String) -> MockCustomPlayer {
        let player = MockCustomPlayer()
        player.overrideCurrentItem = MockPlayerItem.createOnUsingAsset(url: url)
        return player
    }

}
