//
//  PlayerContextDelegateProxy.swift
//  Mouv
//
//  Created by Jean-Charles Dessaint on 11/05/2018.
//  Copyright © 2018 radiofrance. All rights reserved.
//

import RxCocoa
import RxSwift

extension ConcretePlayerContext: HasDelegate {
    public typealias Delegate = PlayerContextDelegate
}

public class RxPlayerContextDelegateProxy: DelegateProxy<ConcretePlayerContext, PlayerContextDelegate>,
                                           DelegateProxyType,
                                           PlayerContextDelegate {
    
    // MARK: - Initialization
    
    public init(playerContext: ConcretePlayerContext) {
        super.init(parentObject: playerContext, delegateProxy: RxPlayerContextDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { RxPlayerContextDelegateProxy(playerContext: $0) }
    }

    // MARK: - Proxy Subjects
    
    internal lazy var stateSubject = PublishSubject<ModernAVPlayer.PlayerState>()
    internal lazy var currentTimeSubject = PublishSubject<Double?>()
    internal lazy var itemDurationSubject = PublishSubject<Double?>()
    internal lazy var debugMessageSubject = PublishSubject<String?>()
    internal lazy var currentItemUrlSubject = PublishSubject<URL?>()
    
    // MARK: - PlayerContextDelegate
    
    public func playerContext(_ context: ConcretePlayerContext, state: ModernAVPlayer.PlayerState) {
        stateSubject.onNext(state)
    }

    public func playerContext(_ context: ConcretePlayerContext, currentTime: Double?) {
        currentTimeSubject.onNext(currentTime)
    }
    
    public func playerContext(_ context: ConcretePlayerContext, itemDuration: Double?) {
        itemDurationSubject.onNext(itemDuration)
    }
    
    public func playerContext(_ context: ConcretePlayerContext, debugMessage: String?) {
        debugMessageSubject.onNext(debugMessage)
    }
    
    public func playerContext(_ context: ConcretePlayerContext, currentItemUrl: URL?) {
        currentItemUrlSubject.onNext(currentItemUrl)
    }

    // MARK: - Deinit

    deinit {
        self.stateSubject.on(.completed)
        self.currentTimeSubject.on(.completed)
        self.itemDurationSubject.on(.completed)
        self.debugMessageSubject.on(.completed)
        self.currentItemUrlSubject.on(.completed)
    }
}
