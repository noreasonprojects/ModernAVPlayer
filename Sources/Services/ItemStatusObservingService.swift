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
    
    var item: AVPlayerItem
    var itemStatusCallback: ((AVPlayerItemStatus) -> Void)?
    
    init(item: AVPlayerItem) {
        LoggerInHouse.instance.log(message: "Init", event: .debug)
        self.item = item
        super.init()
        
        item.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: [.new], context: nil)
    }
    
    deinit {
        LoggerInHouse.instance.log(message: "Deinit", event: .debug)
        item.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.status))
    }
    
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
        
        itemStatusCallback?(status)
    }
}
