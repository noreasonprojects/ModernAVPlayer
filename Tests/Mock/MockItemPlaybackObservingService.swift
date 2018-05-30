//
//  MockItemPlaybackObservingService.swift
//  RFAVPlayer_Example
//
//  Created by Jean-Charles Dessaint on 20/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import ModernAVPlayer

final class MockItemPlaybackObservingService: PlaybackObservingService {
    var onPlaybackStalled: (() -> Void)?
    var onPlayToEndTime: (() -> Void)?
    var onFailedToPlayToEndTime: (() -> Void)?
}
