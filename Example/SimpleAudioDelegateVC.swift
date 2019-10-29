//
//  SimpleAudioDelegate.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 16/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import ModernAVPlayer
import UIKit

final class SimpleAudioDelegateVC: UIViewController {

    // MARK: - Inputs

    private let player: ModernAVPlayer = {
        let conf = PlayerConfigurationExample()
        return ModernAVPlayer(config: conf, loggerDomains: [.error, .unavailableCommand])
    }()
    private var currentTime: Double?
    private var itemDuration: Double?
    private let dataSource: [MediaResource] = [.live, .remote, .local, .invalid]

    // MARK: - Interface Buidler

    @IBOutlet weak private var stateLabel: UILabel!
    @IBOutlet weak private var timingLabel: UILabel!
    @IBOutlet weak private var mediaPicker: UIPickerView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        player.delegate = self
        mediaPicker.dataSource = self
        mediaPicker.delegate = self

        player.load(media: dataSource[0].playerMedia, autostart: false)
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
        guard let position = currentTime else { return }
        let newPosition = position - 15
        guard newPosition >= 0 else { return }
        player.seek(position: newPosition)
    }

    @IBAction func nextSeek(_ sender: UIButton) {
        guard let position = currentTime, let duration = itemDuration
            else { return }
        let newPosition = position + 15
        guard newPosition < duration else { return }
        player.seek(position: position + 15)
    }
}

extension SimpleAudioDelegateVC: ModernAVPlayerDelegate {
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

extension SimpleAudioDelegateVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
}

extension SimpleAudioDelegateVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row].description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let playerMedia = dataSource[row].playerMedia
        player.load(media: playerMedia, autostart: false)
    }
}
