//
//  PlayerPlugin.swift
//  ModernAVPlayer
//
//  Created by raphael ankierman on 30/05/2018.
//

import AVFoundation

public protocol PlayerPlugin {
    /**
    Method called when Player is in Init state
     - parameters:
        - player: instance of AVPlayer used
     */
    func didInit(player: AVPlayer)
    
    /**
    Method called when Player is in Loaded state
     - parameters:
        - media: PlayerMedia just loaded
     */
    func didLoadMedia(_ media: PlayerMedia?)
}
