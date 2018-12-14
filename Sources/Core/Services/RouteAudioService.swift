// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// RouteAudioService.swift
// Created by raphael ankierman on 03/05/2018.
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

import AVFoundation

final class ModernAVPlayerRouteAudioService {
 
    // MARK: - Output
    
    var onRouteChanged: ((AVAudioSession.RouteChangeReason) -> Void)?
    
    // MARK: - Variable
    
    private let notificationName = AVAudioSession.routeChangeNotification
    
    // MARK: - Init
    
    init() {
        ModernAVPlayerLogger.instance.log(message: "Init", domain: .lifecycleService)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(audioRouteChanged),
                                               name: notificationName,
                                               object: nil)
    }
    
    deinit {
        ModernAVPlayerLogger.instance.log(message: "Deinit", domain: .lifecycleService)
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
    
    @objc
    private func audioRouteChanged(notification: Notification) {
        ModernAVPlayerLogger.instance.log(message: "Update audio route detected", domain: .service)
        guard
            let info = notification.userInfo,
            let reasonInt = info[AVAudioSessionRouteChangeReasonKey] as? UInt,
            let reason = AVAudioSession.RouteChangeReason(rawValue: reasonInt)
            else { return }
        
        onRouteChanged?(reason)
    }
}
