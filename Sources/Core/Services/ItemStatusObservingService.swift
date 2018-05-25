//
//  ItemStatusObservingService.swift
//  RxAudioPlayerSM
//
//  Created by raphael ankierman on 22/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import AVFoundation
import Foundation

final class ItemStatusObservingService: NSObject {
    
    // MARK: - Inputs
    
    private let item: AVPlayerItem
    private let itemStatusCallback: (AVPlayerItemStatus) -> Void
    
    // MARK: - Init
    
    init(item: AVPlayerItem, callback: @escaping (AVPlayerItemStatus) -> Void) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.item = item
        self.itemStatusCallback = callback
        super.init()
        
        item.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: [.new], context: nil)
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        item.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.status))
    }

    // MARK: - Service
    
    /*
     Fetch only nil values when observe with the new kvo block observe.
     keypath used: \.status
     */
    //swiftlint:disable:next block_based_kvo
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey: Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard
            let change = change,
            let rawStatus = change[.newKey] as? Int,
            let status = AVPlayerItemStatus(rawValue: rawStatus)
            else { return }
        
        itemStatusCallback(status)
    }
}
