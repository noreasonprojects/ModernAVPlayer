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
    var selectedMediaIndex: Int { get set }
}

final class ModernAudioQueueLibrary: AudioQueueLibrary {

    let dataSource = AudioQueueResource.localMedias()
    var selectedMediaIndex = 0
}
