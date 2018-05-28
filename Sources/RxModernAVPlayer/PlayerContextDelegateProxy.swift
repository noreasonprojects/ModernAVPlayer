//
//  PlayerContextDelegateProxy.swift
//  ModernAVPlayer
//
//  Created by Jean-Charles Dessaint on 16/05/2018.
//

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
    lazy var currentTimeSubject = PublishSubject<Double?>()
    lazy var itemDurationSubject = PublishSubject<Double?>()
    lazy var debugMessageSubject = PublishSubject<String?>()
    lazy var currentItemUrlSubject = PublishSubject<URL?>()
    
    // MARK: - PlayerContextDelegate
    
    public func modernAVPlayer(state: ModernAVPlayer.State) {
        stateSubject.onNext(state)
    }
    
    public func modernAVPlayer(currentTime: Double?) {
        currentTimeSubject.onNext(currentTime)
    }
    
    public func modernAVPlayer(itemDuration: Double?) {
        itemDurationSubject.onNext(itemDuration)
    }
    
    public func modernAVPlayer(debugMessage: String?) {
        debugMessageSubject.onNext(debugMessage)
    }
    
    public func modernAVPlayer(currentItemUrl: URL?) {
        currentItemUrlSubject.onNext(currentItemUrl)
    }
}
