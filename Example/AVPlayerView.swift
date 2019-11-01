//
//  AVPlayerView.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 01/11/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import AVFoundation

final class AVPlayerView: UIView {

    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

