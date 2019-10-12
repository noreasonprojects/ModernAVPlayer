//
//  DemoScreen.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 12/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

enum DemoScreens {
    case monkeyTests

    var id: String {
        switch self {
        case .monkeyTests:
            return "MonkeyTests"
        }
    }

    var description: String {
        switch self {
        case .monkeyTests:
            return "Monkey Tests"
        }
    }
}
