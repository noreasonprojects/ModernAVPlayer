//
//  PlayerContextDelegateProxy.swift
//  ModernAVPlayer
//
//  Created by Jean-Charles Dessaint on 16/05/2018.
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
        register { RxPlayerContextDelegateProxy(playerContext: $0) }
    }
    
    // MARK: - Proxy Subjects
    
    lazy var stateSubject = PublishSubject<ModernAVPlayer.PlayerState>()
    lazy var currentTimeSubject = PublishSubject<Double?>()
    lazy var itemDurationSubject = PublishSubject<Double?>()
    lazy var debugMessageSubject = PublishSubject<String?>()
    lazy var currentItemUrlSubject = PublishSubject<URL?>()
    
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
        stateSubject.on(.completed)
        currentTimeSubject.on(.completed)
        itemDurationSubject.on(.completed)
        debugMessageSubject.on(.completed)
        currentItemUrlSubject.on(.completed)
    }
}
