//
//  AudioQueueLibrary.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 23/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import ModernAVPlayer

protocol AudioQueueLibrary: class {
    var dataSource: [ModernAVPlayerMedia] { get }
    var index: Int { get }
    var selectedMedia: ModernAVPlayerMedia { get }

    func changeMedia(userAction: ModernAudioQueueLibrary.UserAction)
}

final class ModernAudioQueueLibrary: AudioQueueLibrary {

    enum UserAction {
        case prevTrack, nextTrack
    }

    private var selectedMediaIndex = 0

    let dataSource = AudioQueueResource.localMedias()
    var index: Int {
        abs(selectedMediaIndex % dataSource.count)
    }
    var selectedMedia: ModernAVPlayerMedia {
        dataSource[index]
    }

    func changeMedia(userAction: UserAction) {
        switch userAction {
        case .prevTrack:
            selectedMediaIndex -= 1
        case .nextTrack:
            selectedMediaIndex += 1
        }
    }
}
