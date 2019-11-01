//
//  SimpleVideo.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 31/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import AVFoundation
import ModernAVPlayer
import UIKit

final class SimpleVideoVC: UIViewController {

    // MARK: - Inputs

    private let player: ModernAVPlayer = {
        let conf = PlayerConfigurationExample()
        return ModernAVPlayer(config: conf, loggerDomains: [.error, .unavailableCommand])
    }()
    private var currentTime: Double?
    private var itemDuration: Double?
    private let seekTime: Double = 5
    private let dataSource: [MediaResource] = [.custom("https://file-examples.com/wp-content/uploads/2018/04/file_example_MOV_480_700kB.mov")]

    // MARK: - Interface Buidler

    @IBOutlet weak private var stateLabel: UILabel!
    @IBOutlet weak private var timingLabel: UILabel!
    @IBOutlet weak private var playerVideo: AVPlayerView!
    @IBOutlet weak private var prevSeek: UIButton!
    @IBOutlet weak private var nextSeek: UIButton!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Simple HLS Video"
        prevSeek.setTitle("- \(seekTime)", for: .normal)
        nextSeek.setTitle("+ \(seekTime)", for: .normal)

        player.delegate = self
        player.load(media: dataSource[0].playerMedia, autostart: false)

        guard let videoLayer = playerVideo.layer as? AVPlayerLayer
            else { return }
        videoLayer.player = player.player
    }

    // MARK: - Commands

    @IBAction func play(_ sender: UIButton) {
        player.play()
    }

    @IBAction func pause(_ sender: UIButton) {
        player.pause()
    }

    @IBAction func stop(_ sender: Any) {
        player.stop()
    }

    @IBAction func loop(_ sender: UIButton) {
        player.loopMode = !player.loopMode
        sender.isSelected = player.loopMode
    }

    @IBAction func prevSeek(_ sender: UIButton) {
        guard let currentPosition = currentTime else { return }
        let position = max(currentPosition - seekTime, 0)
        player.seek(position: position)
    }

    @IBAction func nextSeek(_ sender: UIButton) {
        guard let currentPosition = currentTime, let duration = itemDuration
            else { return }

        let position = currentPosition + seekTime
        guard position < duration else { return }

        player.seek(position: position)
    }
}

extension SimpleVideoVC: ModernAVPlayerDelegate {
    func modernAVPlayer(_ player: ModernAVPlayer, didStateChange state: ModernAVPlayer.State) {
        DispatchQueue.main.async { self.stateLabel.text = "State: " + state.description }
    }

    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentTimeChange currentTime: Double) {
        self.currentTime = currentTime
        DispatchQueue.main.async { self.timingLabel.text = "Timing: " + String(format: "%.2f", currentTime) }
    }

    func modernAVPlayer(_ player: ModernAVPlayer, didItemDurationChange itemDuration: Double?) {
        self.itemDuration = itemDuration
    }
}
