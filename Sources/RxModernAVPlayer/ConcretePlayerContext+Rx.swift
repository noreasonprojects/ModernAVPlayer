// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ConcretePlayerContext+Rx.swift
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

public extension Reactive where Base: ModernAVPlayer {
    
    var delegate: DelegateProxy<ModernAVPlayer, ModernAVPlayerDelegate> {
        return RxPlayerContextDelegateProxy.proxy(for: base)
    }
    
    var state: Observable<ModernAVPlayer.State> {
        return RxPlayerContextDelegateProxy.proxy(for: base).stateSubject.asObservable()
    }
    
    var currentMedia: Observable<PlayerMedia?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).currentMediaSubject.asObservable()
    }
    
    var currentTime: Observable<Double> {
        return RxPlayerContextDelegateProxy.proxy(for: base).currentTimeSubject.asObservable()
    }
    
    var itemDuration: Observable<Double?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).itemDurationSubject.asObservable()
    }
    
    var debugMessage: Observable<String?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).debugMessageSubject.asObservable()
    }
    
    var itemPlayToEndTime: Observable<Double> {
        return RxPlayerContextDelegateProxy.proxy(for: base).itemPlayToEndTimeSubject.asObservable()
    }
}
