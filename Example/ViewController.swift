// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ViewController.swift
// Created by raphael ankierman on 21/02/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import ModernAVPlayer
import UIKit

final class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak private var playerStateLabel: UILabel!
    @IBOutlet weak private var timingLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var positionSlider: UISlider!
    @IBOutlet private var fixedSeekButtons: [UIButton]!
    @IBOutlet weak private var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak private var debugMessage: UILabel!
    @IBOutlet weak private var currentItemLabel: UILabel!
    
    // MARK: - Actions

    @IBAction func pause(_ sender: UIButton) {
        player.pause()
    }

    @IBAction func play(_ sender: UIButton) {
        player.play()
    }

    @IBAction func fixSeeking(_ sender: UIButton) {
        let currentTime = timingLabel.text ?? "0"
        guard let currentTimeInDouble = Double(currentTime)
            else { setDebugMessage("Seek unavailable, load a media first"); return }
        guard currentTimeInDouble.isFinite
            else { setDebugMessage("Seek unavailable for live audio"); return }

        let seektime = (sender.tag == 0) ? currentTimeInDouble - 10 : currentTimeInDouble + 10
        player.seek(position: seektime)
    }

    @IBAction func stop(_ sender: UIButton) {
        player.stop()
    }

    @IBAction func loadMedia(_ sender: UIButton) {
        let media = medias[sender.tag % 3]
        loadMedia(media, shouldPlaying: sender.tag < 3)
    }

    @IBAction func loadInvalidFormat(_ sender: UIButton) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "noreason", ofType: "txt")!)
        let media = ModernAVPlayerMedia(url: url, type: .clip)
        loadMedia(media, shouldPlaying: true)
    }
    
    @IBAction func loadInvalidRemoteUrl(_ sender: UIButton) {
        let url = URL(string: "foo://noreason")!
        let media = ModernAVPlayerMedia(url: url, type: .clip)
        loadMedia(media, shouldPlaying: true)
    }
    
    // MARK: - Private vars

    private let player = ModernAVPlayer()
    private var commandCenter: SetupCommandCenter?
    private var itemDuration: Double? {
        didSet {
            guard let duration = itemDuration else { return }
            durationLabel.text = String(format: "%.2f", duration)
        }
    }
    private var currentTime: Double? {
        didSet {
            guard let time = currentTime else { return }
            timingLabel.text = String(format: "%.2f", time)
            setSliderValue(currentTime: time)
        }
    }
    private var medias: [PlayerMedia] {
        //swiftlint:disable force_unwrapping
        let liveUrl = URL(string: "http://direct.franceinter.fr/live/franceinter-midfi.mp3")!
        let remoteClip = URL(string: "http://media.radiofrance-podcast.net/podcast09/13100-17.01.2017-ITEMA_21199585-0.mp3")!
        let localClip = URL(fileURLWithPath: Bundle.main.path(forResource: "AllNew", ofType: "mp3")!)
        //swiftlint:enable force_unwrapping
        return [
            ModernAVPlayerMedia(url: liveUrl, type: .stream(isLive: true), title: "Le live",
                                albumTitle: "Album0", artist: "Artist0", localImageName: "sennaLive"),
            ModernAVPlayerMedia(url: remoteClip, type: .clip, title: "Remote clip",
                                albumTitle: "Album1", artist: "Artist1", localImageName: "sennaClip"),
            ModernAVPlayerMedia(url: localClip, type: .clip, title: "Local clip",
                                albumTitle: "Album2", artist: "Artist2", localImageName: "ankierman",
                                remoteImageUrl: URL(string: "https://goo.gl/U4QoQj"))
        ]
    }

    private var state: ModernAVPlayer.State? {
        didSet {
            DispatchQueue.main.async {
                self.playerStateLabel.text = self.state?.description

                if let s = self.state, s == .playing, self.isSliderSeeking {
                    self.isSliderSeeking = false
                }
                if self.isPlayerWorking() {
                    self.indicatorView.startAnimating()
                } else {
                    self.indicatorView.stopAnimating()
                }
            }
        }
    }
    private var isSliderSeeking = false

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        player.delegate = self
        positionSlider.value = 0
        positionSlider.addTarget(self, action: #selector(ViewController.sliderSeeking(_:)), for: .valueChanged)
        debugMessage.text = nil
        commandCenter = SetupCommandCenter(player: player)
    }

    // MARK: - Slider events

    @objc
    private func sliderSeeking(_ sender: UISlider) {
        guard let duration = itemDuration
            else { setDebugMessage("failed to seek, no duration set"); return }

        isSliderSeeking = true
        let limitedSliderValue = min(sender.value, 0.99)
        let position = Double(limitedSliderValue) * duration
        player.seek(position: position)
    }

    private func setSliderValue(currentTime: Double) {
        guard let duration = itemDuration else { return }
        guard duration.isFinite else { positionSlider.value = 0; return }
        guard duration > 0, !isSliderSeeking else { return }

        let position = Float(min(currentTime / duration, 1))
        positionSlider.value = position
    }

    // MARK: - Player utils

    private func loadMedia(_ media: PlayerMedia, shouldPlaying: Bool) {
        player.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }

    private func isPlayerWorking() -> Bool {
        return state == .buffering || state == .loading || state == .waitingForNetwork
    }

    private func setDebugMessage(_ msg: String?) {
        self.debugMessage.text = msg
        self.debugMessage.alpha = 1.0
        UIView.animate(withDuration: 1.5, animations: {
            self.debugMessage.alpha = 0
        }, completion: nil)
    }
}

// MARK: - PLayerContextDelegate

extension ViewController: ModernAVPlayerDelegate {
    func modernAVPlayer(_ player: ModernAVPlayer, didStateChange state: ModernAVPlayer.State) {
        self.state = state
    }
    
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentTimeChange currentTime: Double?) {
        self.currentTime = currentTime
    }
    
    func modernAVPlayer(_ player: ModernAVPlayer, didItemDurationChange itemDuration: Double?) {
        self.itemDuration = itemDuration
    }
    
    func modernAVPlayer(_ player: ModernAVPlayer, debugMessage: String?) {
        setDebugMessage(debugMessage)
    }
    
    func modernAVPlayer(_ player: ModernAVPlayer, didCurrentItemUrlChange currentItemUrl: URL?) {
        DispatchQueue.main.async {
            self.currentItemLabel.text = currentItemUrl?.absoluteString
        }
    }
}
