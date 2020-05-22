//
//  SimpleAudioQueueVC.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 22/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import ModernAVPlayer
import RxSwift
import RxCocoa
import UIKit

final class SimpleAudioQueueVC: UIViewController {

    // MARK: - Inputs

    private let player: ModernAVPlayer = {
        let conf = PlayerConfigurationExample()
        return ModernAVPlayer(config: conf, loggerDomains: [.error, .unavailableCommand])
    }()
    private let library = ModernAudioQueueLibrary()
    private lazy var remote: AudioQueueRemoteExample = {
        return AudioQueueRemoteExample(player: self.player, library: self.library)
    }()
    private let disposeBag = DisposeBag()

    // MARK: - Interface Buidler

    @IBOutlet weak private var mediaLabel: UILabel!
    @IBOutlet weak private var stateLabel: UILabel!
    @IBOutlet weak private var timingLabel: UILabel!
    @IBOutlet weak private var itemDuration: UILabel!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Simple Audio Queue"

        setupRxLabels()
        player.remoteCommands = remote.defaultCommands
        setupRemoteCallback()

        loadMedia(index: 0)
    }

    private func setupRxLabels() {
        player.rx.state
            .map({ "State: " + $0.description })
            .bind(to: stateLabel.rx.text)
            .disposed(by: disposeBag)

        player.rx.currentTime
            .map({ "Current time: " + $0.description })
            .bind(to: timingLabel.rx.text)
            .disposed(by: disposeBag)

        player.rx.itemDuration
            .map({
                if let txt = $0?.description { return "Duration: " + txt }
                else { return "Duration is nil" }
            })
            .bind(to: itemDuration.rx.text)
            .disposed(by: disposeBag)
    }

    private func setupMediaIndexLabel(index: String) {
        mediaLabel.text = "Media index: " + index
    }

    private func setupRemoteCallback() {
        remote.selectedMediaIndexChanged = { [weak self] index in
            self?.setupMediaIndexLabel(index: index)
        }
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

    @IBAction func prevSeek(_ sender: UIButton) {
        library.selectedMediaIndex -= 1
        let index = abs(library.selectedMediaIndex % library.dataSource.count)
        loadMedia(index: index)
    }

    @IBAction func nextSeek(_ sender: UIButton) {
        library.selectedMediaIndex += 1
        let index = abs(library.selectedMediaIndex % library.dataSource.count)
        loadMedia(index: index)
    }

    private func loadMedia(index: Int) {
        setupMediaIndexLabel(index: index.description)
        let sample = library.dataSource[index]
        player.load(media: sample, autostart: true)
    }
}
