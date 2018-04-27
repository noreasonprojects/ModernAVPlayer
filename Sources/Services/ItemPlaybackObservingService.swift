//
//  ItemPlaybackObservingService.swift
//  RFAVPlayer
//
//  Created by Jean-Charles Dessaint on 20/04/2018.
//

import Foundation

public protocol ItemPlaybackObservingServiceProtocol {
    var onPlaybackStalled: (() -> Void)? { get set }
    var onPlayToEndTime: (() -> Void)? { get set }
}

public final class ItemPlaybackObservingService: ItemPlaybackObservingServiceProtocol {
    public var onPlaybackStalled: (() -> Void)?
    public var onPlayToEndTime: (() -> Void)?
    
    public init() {
            NotificationCenter.default.addObserver(self, selector: #selector(ItemPlaybackObservingService.itemPlaybackStalled),
                                                   name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(ItemPlaybackObservingService.itemPlayToEndTime),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(ItemPlaybackObservingService.itemFailedToPlayToEndTime),
                                                   name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemPlaybackStalled,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime,
                                                  object: nil)
    }
    
    @objc
    private func itemPlaybackStalled() {
        onPlaybackStalled?()
    }
    
    @objc
    private func itemPlayToEndTime() {
        itemPlayToEndTime()
    }
    
    @objc
    private func itemFailedToPlayToEndTime() {
        LoggerInHouse.instance.log(message: "Item failed to play endtime notification", event: .warning)
    }
}
