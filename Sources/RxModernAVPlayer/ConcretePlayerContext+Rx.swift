//
//  ConcretePlayerContext+Rx.swift
//  Mouv
//
//  Created by Jean-Charles Dessaint on 11/05/2018.
//  Copyright © 2018 radiofrance. All rights reserved.
//

//import ModernAVPlayer
import RxCocoa
import RxSwift

extension Reactive where Base: ConcretePlayerContext {

    var delegate: DelegateProxy<ConcretePlayerContext, PlayerContextDelegate> {
        return RxPlayerContextDelegateProxy.proxy(for: base)
    }
    
    var state: Observable<ModernAVPlayer.PlayerState> {
        return RxPlayerContextDelegateProxy.proxy(for: base).stateSubject.asObservable()
    }

    var currentTime: Observable<Double?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).currentTimeSubject.asObservable()
    }

    var itemDuration: Observable<Double?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).itemDurationSubject.asObservable()
    }

    var debugMessage: Observable<String?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).debugMessageSubject.asObservable()
    }

    var currentItemUrl: Observable<URL?> {
        return RxPlayerContextDelegateProxy.proxy(for: base).currentItemUrlSubject.asObservable()
    }
}
