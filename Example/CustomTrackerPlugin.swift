//
//  ModernAVPlayerPlugin.swift
//  ModernAVPlayer_Example
//
//  Created by raphael ankierman on 26/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AVFoundation
import ModernAVPlayer

protocol CustomTracker {
    var customAttribute: String? { get }
}

final class CustomTrackerPlugin: PlayerPlugin {
    
    func didLoad(media: PlayerMedia?, duration: Double?) {
        guard let attr = (media as? ModernAVPlayerMedia)?.metadata?.customAttribute
            else { assertionFailure(); return }
        print("~~~ PLUGIN: customAttribute=\(attr)")
    }
    
    func didInit(player: AVPlayer) { }
    func didStartLoading() { }
    func didStartBuffering() { }
    func didStartPlaying() { }
    func didPaused() { }
    func didStopped() { }
    func didStartWaitingForNetwork() { }
    func didFailed() { }
    
}
