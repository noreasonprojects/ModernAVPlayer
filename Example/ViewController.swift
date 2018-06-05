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
import RxSwift
import RxCocoa
import UIKit

struct Data {
    static let medias: [PlayerMedia] = {
        guard
            let liveUrl = URL(string: "http://direct.franceinter.fr/live/franceinter-midfi.mp3"),
            let remoteClip = URL(string: "http://media.radiofrance-podcast.net/podcast09/13100-17.01.2017-ITEMA_21199585-0.mp3"),
            let file = Bundle.main.path(forResource: "AllNew", ofType: "mp3")
            else { assertionFailure(); return [] }
        
        let localClip = URL(fileURLWithPath: file)
        return [
            ModernAVPlayerMedia(url: liveUrl, type: .stream(isLive: true), title: "Le live",
                                albumTitle: "Album0", artist: "Artist0", localImageName: "sennaLive"),
            ModernAVPlayerMedia(url: remoteClip, type: .clip, title: "Remote clip",
                                albumTitle: "Album1", artist: "Artist1", localImageName: "sennaClip"),
            ModernAVPlayerMedia(url: localClip, type: .clip, title: "Local clip",
                                albumTitle: "Album2", artist: "Artist2", localImageName: "ankierman",
                                remoteImageUrl: URL(string: "https://goo.gl/U4QoQj"))
        ]
    }()
}

final class ViewController: UIViewController {

    enum PositionRequest {
        case currentTime(time: Double?, duration: Double?)
        case seekTime(Double)
        case seekRatio(Float)
    }
    
    // MARK: - Outlets

    @IBOutlet weak private var playerStateLabel: UILabel!
    @IBOutlet weak private var timingLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak private var debugMessage: UILabel!
    @IBOutlet weak private var currentItemLabel: UILabel!
    
    // MARK: - Player Commands

    @IBAction func pause(_ sender: UIButton) {
        player.pause()
    }

    @IBAction func play(_ sender: UIButton) {
        player.play()
    }

    @IBAction func stop(_ sender: UIButton) {
        player.stop()
    }

    @IBAction func loadMedia(_ sender: UIButton) {
        let media = Data.medias[sender.tag % 3]
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
    
    // MARK: - Variables

    private let player = ModernAVPlayer()
    private var commandCenter: SetupCommandCenter?
    
    // MARK: - Observables
    
    private let concurrentBackgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    private let disposeBag = DisposeBag()
    private var sliderEvents: [Observable<Bool>] = []
    private var isSliderSeeking: Observable<Bool>!
    private var sliderValue: ControlProperty<Float>!
    private let itemDurationSubject = BehaviorSubject<Double?>(value: 0)
    private let positionChanged = PublishSubject<PositionRequest>()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugMessage.text = nil
        initSliderObservables()
        bindPlayerRxAttibutes()
        commandCenter = SetupCommandCenter(player: player)
    }
    
    private func initSliderObservables() {
        sliderEvents = [
            slider.rx.controlEvent(.valueChanged).map { return true },
            slider.rx.controlEvent(.touchUpInside).map { return false },
            slider.rx.controlEvent(.touchUpOutside).map { return false }
        ]
        isSliderSeeking = Observable.merge(sliderEvents).startWith(false)
        sliderValue = slider.rx.value
    }

    // MARK: - Player

    private func seek(position: Double) {
        player.seek(position: position)
    }
    
    private func loadMedia(_ media: PlayerMedia, shouldPlaying: Bool) {
        player.loadMedia(media: media, shouldPlaying: shouldPlaying)
    }

    private func isPlayerWorking(state: ModernAVPlayer.State) -> Bool {
        return state == .buffering || state == .loading || state == .waitingForNetwork
    }

    private func setDebugMessage(_ msg: String?) {
        self.debugMessage.text = msg
        self.debugMessage.alpha = 1.0
        UIView.animate(withDuration: 1.5) { self.debugMessage.alpha = 0 }
    }
    
    private func formatPosition(_ position: PositionRequest) -> String? {
        switch position {
        case .currentTime(let time, _):
            guard let t = time else { return nil }
            return String(format: "%.2f", t)
        case .seekRatio(let ratio):
            return "ratio:\(ratio)"
        case .seekTime(let time):
            return String(format: "%.2f", time)
        }
    }
    
    private func createPositionRequest(state: ModernAVPlayer.State,
                                       currentTime: Double?,
                                       isSliderSeeking: Bool,
                                       sliderPosition: Float,
                                       optDuration: Double?) -> PositionRequest {
        
        guard isSliderSeeking || state == .buffering
            else { return .currentTime(time: currentTime, duration: optDuration) }
        
        guard let duration = optDuration else { return .seekRatio(sliderPosition) }
        
        return .seekTime(Double(sliderPosition) * duration)
    }
    
    private func setSliderPosition(current: Double, duration: Double) -> Float {
        return Float(current / duration)
    }
    
    private func setSeekPosition(from duration: Double) -> Double {
        return Double(slider.value) * duration
    }
}

// MARK: - Player RxSwift

extension ViewController {
    
    private func bindPlayerRxAttibutes() {
        
        // Display current time label
        Observable
            .combineLatest(player.rx.currentTime.distinctUntilChanged(),
                           slider.rx.value.asObservable().distinctUntilChanged())
            .withLatestFrom(itemDurationSubject.asObservable()) { return ($0.0, $0.1, $1) }
            .withLatestFrom(player.rx.state) { return ($0.0, $0.1, $0.2, $1) }
            .withLatestFrom(isSliderSeeking) { return ($0.3, $0.0, $1, $0.1, $0.2) }
            .subscribeOn(concurrentBackgroundScheduler)
            .map(createPositionRequest)
            .map(formatPosition)
            .asDriver(onErrorJustReturn: "error")
            .drive(timingLabel.rx.text)
            .disposed(by: disposeBag)
        
        // Seek
        isSliderSeeking
            .distinctUntilChanged()
            .skip(1) // skip init value
            .filter { !$0 }
            .withLatestFrom(itemDurationSubject.asObservable())
            .filter { $0 != nil }.map { $0! }
            .map(setSeekPosition)
            .subscribe(onNext: seek)
            .disposed(by: disposeBag)
        
        // Set slider value
        Observable
            .combineLatest(isSliderSeeking, player.rx.currentTime, player.rx.state)
            .filter { !$0.0 }
            .map { return ($0.1, $0.2) }
            .withLatestFrom(itemDurationSubject.asObservable()) { return ($0, $1) }
            .filter { args, _ -> Bool in
                let (_, state) = args
                return state == .playing || state == .stopped
            }
            .filter { args, duration -> Bool in
                let (current, _) = args
                return current != nil && duration != nil
            }
            .map { return ($0.0.0!, $0.1!) } //unwrap current time & duration
            .map(setSliderPosition)
            .bind(to: slider.rx.value)
            .disposed(by: disposeBag)
        
        // Display itemUrl
        player.rx.currentItemUrl
            .observeOn(concurrentBackgroundScheduler)
            .map { $0?.absoluteString }
            .asDriver(onErrorJustReturn: nil)
            .drive(currentItemLabel.rx.text)
            .disposed(by: disposeBag)
        
        // Display dbugMessage
        player.rx.debugMessage
            .asDriver(onErrorJustReturn: "error")
            .drive(onNext: setDebugMessage)
            .disposed(by: disposeBag)
        
        // Display item duration
        player.rx.itemDuration
            .observeOn(concurrentBackgroundScheduler)
            .filter { $0 != nil }
            .map { String(format: "%.2f", $0!) }
            .asDriver(onErrorJustReturn: "error")
            .drive(durationLabel.rx.text)
            .disposed(by: disposeBag)
        
        player.rx.itemDuration
            .bind(to: itemDurationSubject)
            .disposed(by: disposeBag)
        
        // Animate state working loader
        player.rx.state
            .observeOn(concurrentBackgroundScheduler)
            .map(isPlayerWorking)
            .asDriver(onErrorJustReturn: false)
            .drive(indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        
        // Display state
        player.rx.state
            .observeOn(concurrentBackgroundScheduler)
            .map { $0.description }
            .asDriver(onErrorJustReturn: "error")
            .drive(playerStateLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
