// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// PlayerPlugin.swift
// Created by raphael ankierman on 30/05/2018.
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

public protocol PlayerPlugin {
    ///
    /// Called when Player enters Initialization state
    /// - parameters:
    ///    - player: instance of AVPlayer used
    ///
    func didInit(player: AVPlayer)
    
    /// Called when the media will start loading
    func willStartLoading()
    
    /// Called when the media has started loading
    func didStartLoading()
    
    /// Called before buffering media
    func didStartBuffering()
    
    ///
    /// Called when the media is loaded
    /// - parameters:
    ///    - media: PlayerMedia just loaded
    ///
    func didLoad(media: PlayerMedia, duration: Double?)
    
    ///
    /// Called when the media change
    /// - parameters:
    ///    - media: PlayerMedia just loaded
    ///    - previousMedia: PlayerMedia loaded before
    ///
    func didChangeMedia(_ media: PlayerMedia, previousMedia: PlayerMedia?)
    
    /// Called when the media is playing
    func didStartPlaying()
    
    /// Called when the media is paused
    func didPaused()
    
    /// Called when the media is stopped
    func didStopped()
    
    /// Called when player check network access
    func didStartWaitingForNetwork()
    
    /// Called when the media failed
    func didFailed(error: PlayerError)
    
    /// Called when media play to his end time
    func didItemPlayToEndTime(endTime: Double)
}
