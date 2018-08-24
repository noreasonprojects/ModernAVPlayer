// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// AudioSessionService.swift
// Created by raphael ankierman on 21/03/2018.
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

protocol AudioSessionService {
    static func activate()
    static func setCategory(_ category: String, with options: AVAudioSessionCategoryOptions)
}

struct ModernAVPlayerAudioSessionService: AudioSessionService {

    static func activate() {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                ModernAVPlayerLogger.instance.log(message: "Active audio session", domain: .service)

            } catch {
                ModernAVPlayerLogger.instance.log(message: "Active audio session: \(error.localizedDescription)", domain: .error)
            }
        }
    }

    static func setCategory(_ category: String, with options: AVAudioSessionCategoryOptions) {
        do {
            try AVAudioSession.sharedInstance().setCategory(category, with: options)
            ModernAVPlayerLogger.instance.log(message: "Set audio session category to: \(category)", domain: .service)
        } catch let error {
            ModernAVPlayerLogger.instance.log(message: "Set \(category) category: \(error.localizedDescription)", domain: .error)
        }
    }

}
