// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// RemoteCommandPresetFactory.swift
// Created by raphael ankierman on 16/09/2018.
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

import Foundation
import MediaPlayer

public struct ModernAVPlayerRemoteCommandFactory {

    // MARK: - Output

    /// Return all factory commands
    ///
    public var defaultCommands: [ModernAVPlayerRemoteCommand] {
        return [playCommand(), pauseCommand(), stopCommand(), togglePlayPauseCommand(),
                prevTrackCommand(), nextTrackCommand(), repeatModeCommand(), changePositionCommand(),
                shuffleModeCommand(), skipBackwardCommand(), skipForwardCommand()]
    }

    // MARK: - Inputs

    private let player: ModernAVPlayerExposable
    private let commandCenter: MPRemoteCommandCenter

    // MARK: - Init

    public init(player: ModernAVPlayerExposable,
                commandCenter: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()) {
        self.player = player
        self.commandCenter = commandCenter
    }

    // MARK: - Playback Commands
    
    /// Play Command
    /// When pressing play, if media is not live, a simple play is done
    /// If media is a stream live, we reload the media and play (autostart: true)
    ///
    public func playCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.playCommand
        let isEnabled: (MediaType) -> Bool = { _ in true }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            guard let media = self.player.currentMedia
                else {
                    ModernAVPlayerLogger.instance.log(message: "Failed play remote command",
                                                      domain: .error)
                    return .noSuchContent
            }
            ModernAVPlayerLogger.instance.log(message: "Remote command: play", domain: .service)
            guard case let .stream(isLive) = media.type, isLive
                else { self.player.play(); return .success }
            self.player.load(media: media, autostart: true, position: nil)
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Play",
                                           isEnabled: isEnabled)
    }
    
    /// Toggle play pause command
    ///
    public func togglePlayPauseCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.togglePlayPauseCommand
        let isEnabled: (MediaType) -> Bool = { _ in true }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            ModernAVPlayerLogger.instance.log(message: "Remote command: togglePlayPause", domain: .service)
            switch self.player.state {
            case .buffering, .loading, .playing:
                self.player.pause()
            case .failed, .initialization, .waitingForNetwork:
                return .noSuchContent
            case .loaded, .paused, .stopped:
                self.player.play()
            }
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command, isEnabled: isEnabled)
    }
    
    /// Pause command
    ///
    public func pauseCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.pauseCommand
        let isEnabled: (MediaType) -> Bool = {
            guard case .stream(let isLive) = $0, isLive else { return true }
            return false
        }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            ModernAVPlayerLogger.instance.log(message: "Remote command: pause", domain: .service)
            self.player.pause()
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Toggle play/pause",
                                           isEnabled: isEnabled)
    }

    /// Stop command
    ///
    public func stopCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.stopCommand
        let isEnabled: (MediaType) -> Bool = {
            guard case .stream(let isLive) = $0, isLive else { return false }
            return true
        }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            ModernAVPlayerLogger.instance.log(message: "Remote command: stop", domain: .service)
            self.player.stop()
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Stop",
                                           isEnabled: isEnabled)
    }
    
    // MARK: - Navigating between tracks

    /// Previous Track Command
    /// Not enabled yet
    ///
    public func prevTrackCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.previousTrackCommand
        let isEnabled: (MediaType) -> Bool = { _ in false }
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Prev track",
                                           isEnabled: isEnabled)
    }

    /// Next Track Command
    /// Not enabled yet
    ///
    public func nextTrackCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.nextTrackCommand
        let isEnabled: (MediaType) -> Bool = { _ in false }
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Next track",
                                           isEnabled: isEnabled)
    }

    /// Change Repeat Mode Command
    /// Not enabled yet
    ///
    public func repeatModeCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.changeRepeatModeCommand
        let isEnabled: (MediaType) -> Bool = { _ in false }
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Repeat mode",
                                           isEnabled: isEnabled)
    }

    /// Change Shuffle Mode Command
    /// Not enabled yet
    ///
    public func shuffleModeCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.changeShuffleModeCommand
        let isEnabled: (MediaType) -> Bool = { _ in false }
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Shuffle mode",
                                           isEnabled: isEnabled)
    }

    // MARK: - Navigating a track's contents
    
    /// Change Position Command
    /// Enable for clip media type only
    ///
    public func changePositionCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.changePlaybackPositionCommand
        let isEnabled: (MediaType) -> Bool = { $0 == .clip }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { event in
            guard let e = event as? MPChangePlaybackPositionCommandEvent
                else {
                    ModernAVPlayerLogger.instance.log(message: "Failed changePosition remote command ",
                                                      domain: .error)
                    return .commandFailed
            }

            let position = e.positionTime
            ModernAVPlayerLogger.instance.log(message: "Remote command: seek to \(position)", domain: .service)
            self.player.seek(position: position)
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Change position",
                                           isEnabled: isEnabled)
    }

    /// Skip Backward command
    /// Enable for clip media type only
    ///
    public func skipBackwardCommand(preferredIntervals: [NSNumber] = [10]) -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.skipBackwardCommand
        command.preferredIntervals = preferredIntervals
        let isEnabled: (MediaType) -> Bool = { $0 == .clip }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { event in
            guard
                let skipTime = (event as? MPSkipIntervalCommandEvent)?.interval
                else {
                    ModernAVPlayerLogger.instance.log(message: "Failed skipBackward remote command",
                                                      domain: .error)
                    return .commandFailed
            }

            ModernAVPlayerLogger.instance.log(message: "Remote command: skipBackward", domain: .service)
            let position = max(self.player.currentTime - skipTime, 0)
            self.player.seek(position: position)
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Skip backward",
                                           isEnabled: isEnabled)
    }

    /// Skip Forward command
    /// Enable for clip media type only
    ///
    public func skipForwardCommand(preferredIntervals: [NSNumber] = [10]) -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.skipForwardCommand
        command.preferredIntervals = preferredIntervals
        let isEnabled: (MediaType) -> Bool = { $0 == .clip }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { event in
            guard
                let skipTime = (event as? MPSkipIntervalCommandEvent)?.interval
                else {
                    ModernAVPlayerLogger.instance.log(message: "Failed skipForward remote command ",

                                                      domain: .error)
                    return .commandFailed
            }

            ModernAVPlayerLogger.instance.log(message: "Remote command: skipForward", domain: .service)
            let position = self.player.currentTime + skipTime
            self.player.seek(position: position)
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Skip forward",
                                           isEnabled: isEnabled)
    }
}
