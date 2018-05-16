//
//  MediaType.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 24/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

public enum MediaType {
    case clip
    case stream(isLive: Bool)
}

extension MediaType: Equatable { }

public func == (lhs: MediaType, rhs: MediaType) -> Bool {
    switch (lhs, rhs) {
    case (.clip, .clip):
        return true
    case (.stream, .clip):
        return false
    case (.clip, .stream):
        return false
    case (.stream(let isLiveLeft), .stream(let isLiveRight)):
        return isLiveLeft == isLiveRight
    }
}
