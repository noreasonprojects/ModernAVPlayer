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

//sourcery: AutoMockable
public protocol PlayerPlugin {
    ///
    /// Called when Player enters Initialization state
    /// - parameters:
    ///     - player: current AVPlayer instance in use
    ///
    func didInit(player: AVPlayer)
    
    /// Called when loading will start
    /// - parameters:
    ///    - media: current media in use
    ///
    func willStartLoading(media: PlayerMedia)
    
    /// Called when loading has started
    /// - parameters:
    ///    - media: current media in use
    ///
    func didStartLoading(media: PlayerMedia)
    
    /// Called when buffering has started
    /// - parameters:
    ///    - media: current media in use
    ///
    func didStartBuffering(media: PlayerMedia)
    
    ///
    /// Called when the media is loaded
    /// - parameters:
    ///    - media: current media in use
    ///
    func didLoad(media: PlayerMedia, duration: Double?)
    
    ///
    /// Called when the media has changed
    /// - parameters:
    ///    - media: current media in use
    ///    - previousMedia: previous media in use
    ///
    func didMediaChanged(_ media: PlayerMedia, previousMedia: PlayerMedia?)

    /// Called when the media will start playing
    /// - parameters:
    ///     - media: current media in use
    ///     - position: play position
    ///
    func willStartPlaying(media: PlayerMedia, position: Double)

    /// Called when the media is playing
    /// - parameters:
    ///    - media: current media in use
    ///
    func didStartPlaying(media: PlayerMedia)
    
    /// Called when the media is paused
    /// - parameters:
    ///     - media: current media in use
    ///     - position: pause position
    ///
    func didPaused(media: PlayerMedia?, position: Double)
    
    /// Called when the media is stopped
    /// - parameters:
    ///     - media: current media in use
    ///     - position: stop position
    ///
    func didStopped(media: PlayerMedia?, position: Double)
    
    /// Called when player check network access
    /// - parameters:
    ///    - media: current media in use
    ///
    func didStartWaitingForNetwork(media: PlayerMedia)
    
    /// Called when the media failed
    /// - parameters:
    ///     - media: current media in use
    ///     - error: reason to failed
    ///
    func didFailed(media: PlayerMedia, error: PlayerError)
    
    /// Called when media play to his end time
    /// - parameters:
    ///     - media: current media in use
    ///     - endTime: end time position
    ///
    func didItemPlayToEndTime(media: PlayerMedia, endTime: Double)
}

/// Optional methods
public extension PlayerPlugin {
    func didInit(player: AVPlayer) { }
    func willStartLoading(media: PlayerMedia) { }
    func didStartLoading(media: PlayerMedia) { }
    func didStartBuffering(media: PlayerMedia) { }
    func didLoad(media: PlayerMedia, duration: Double?) { }
    func didMediaChanged(_ media: PlayerMedia, previousMedia: PlayerMedia?) { }
    func willStartPlaying(media: PlayerMedia, position: Double) { }
    func didStartPlaying(media: PlayerMedia) { }
    func didPaused(media: PlayerMedia?, position: Double) { }
    func didStopped(media: PlayerMedia?, position: Double) { }
    func didStartWaitingForNetwork(media: PlayerMedia) { }
    func didFailed(media: PlayerMedia, error: PlayerError) { }
    func didItemPlayToEndTime(media: PlayerMedia, endTime: Double) { }
}
