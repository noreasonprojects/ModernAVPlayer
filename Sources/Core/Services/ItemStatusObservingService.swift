// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ItemStatusObservingService.swift
// Created by raphael ankierman on 22/03/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import AVFoundation

final class ModernAVPLayerItemStatusObservingService: NSObject {
    
    // MARK: - Inputs
    
    private let item: AVPlayerItem
    private let itemStatusCallback: (AVPlayerItem.Status) -> Void
    
    // MARK: - Init
    
    init(item: AVPlayerItem, callback: @escaping (AVPlayerItem.Status) -> Void) {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleService)
        self.item = item
        self.itemStatusCallback = callback
        super.init()
        
        item.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: [.new], context: nil)
    }
    
    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleService)
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
            let status = AVPlayerItem.Status(rawValue: rawStatus)
            else { return }
        
        itemStatusCallback(status)
    }
}
