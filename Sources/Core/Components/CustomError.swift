//
//  CustomError.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 24/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case itemFailedWhenLoading
    case itemPlaybackStalled
    case buffering
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .itemFailedWhenLoading:
            return "loading failed"
        case .itemPlaybackStalled:
            return "item playback stalled"
        case .buffering:
            return "buffering failed"
        }
    }
}
