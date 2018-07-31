// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayerContextDelegateProxy.swift
// Created by Jean-Charles Dessaint on 16/05/2018.
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

import RxCocoa
import RxSwift

extension ModernAVPlayer: HasDelegate {
    public typealias Delegate = ModernAVPlayerDelegate
}

public class RxPlayerContextDelegateProxy: DelegateProxy<ModernAVPlayer, ModernAVPlayerDelegate>,
    DelegateProxyType,
ModernAVPlayerDelegate {
    
    // MARK: - Initialization
    
    public init(playerContext: ModernAVPlayer) {
        super.init(parentObject: playerContext, delegateProxy: RxPlayerContextDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        register { RxPlayerContextDelegateProxy(playerContext: $0) }
    }
    
    // MARK: - Proxy Subjects
    
    lazy var stateSubject = PublishSubject<ModernAVPlayer.State>()
    lazy var currentMediaSubject = PublishSubject<PlayerMedia?>()
    lazy var currentTimeSubject = PublishSubject<Double>()
    lazy var itemDurationSubject = PublishSubject<Double?>()
    lazy var debugMessageSubject = PublishSubject<String?>()
    lazy var itemPlayToEndTimeSubject = PublishSubject<Double>()
    
    // MARK: - ModernAVPlayerDelegate
    
    public func modernAVPlayer(_ player: ModernAVPlayer, didStateChange state: ModernAVPlayer.State) {
        stateSubject.onNext(state)
    }
    
    public func modernAVPlayer(_ player: ModernAVPlayer, didCurrentMediaChange media: PlayerMedia?) {
        currentMediaSubject.onNext(media)
    }
    
    public func modernAVPlayer(_ player: ModernAVPlayer, didCurrentTimeChange currentTime: Double) {
        currentTimeSubject.onNext(currentTime)
    }
    
    public func modernAVPlayer(_ player: ModernAVPlayer, didItemDurationChange itemDuration: Double?) {
        itemDurationSubject.onNext(itemDuration)
    }
    
    public func modernAVPlayer(_ player: ModernAVPlayer, debugMessage: String?) {
        debugMessageSubject.onNext(debugMessage)
    }
    
    public func modernAVPlayer(_ player: ModernAVPlayer, didItemPlayToEndTime endTime: Double) {
        itemPlayToEndTimeSubject.onNext(endTime)
    }
}
