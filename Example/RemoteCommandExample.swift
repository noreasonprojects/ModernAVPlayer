//
//  RemoteCommandExample.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 18/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import MediaPlayer
import ModernAVPlayer

public struct RemoteCommandFactoryExample {

    // MARK: - Output

    /// Return all factory commands
    ///
    public var defaultCommands: [ModernAVPlayerRemoteCommand] {
        return [playCommand(), pauseCommand(), stopCommand(), togglePlayPauseCommand(),
                changePositionCommand(), skipBackwardCommand(), skipForwardCommand()
        ]
    }

    // MARK: - Inputs

    private unowned let player: ModernAVPlayerExposable
    private let commandCenter: MPRemoteCommandCenter

    // MARK: - Init

    public init(player: ModernAVPlayerExposable,
                commandCenter: MPRemoteCommandCenter = MPRemoteCommandCenter.shared()) {
        self.player = player
        self.commandCenter = commandCenter
    }

    // MARK: - Playback Commands

    /// Default play command
    ///
    public func playCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.playCommand
        let isEnabled: (MediaType) -> Bool = { _ in true }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            guard let media = self.player.currentMedia
                else { return .noSuchContent }
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

    /// Default toggle play pause command
    ///
    public func togglePlayPauseCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.togglePlayPauseCommand
        let isEnabled: (MediaType) -> Bool = { _ in true }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
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
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Toggle play/pause",
                                           isEnabled: isEnabled)
    }

    /// Default pause command
    ///
    public func pauseCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.pauseCommand
        let isEnabled: (MediaType) -> Bool = {
            guard case .stream(let isLive) = $0, isLive else { return true }
            return false
        }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            self.player.pause()
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Pause",
                                           isEnabled: isEnabled)
    }

    /// Default stop command
    ///
    public func stopCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.stopCommand
        let isEnabled: (MediaType) -> Bool = {
            guard case .stream(let isLive) = $0, isLive else { return false }
            return true
        }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { _ in
            self.player.stop()
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Stop",
                                           isEnabled: isEnabled)
    }


    // MARK: - Navigating a track's contents

    /// Default change position command
    ///
    public func changePositionCommand() -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.changePlaybackPositionCommand
        let isEnabled: (MediaType) -> Bool = { $0 == .clip }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { event in
            guard let e = event as? MPChangePlaybackPositionCommandEvent
                else { return .commandFailed }
            let position = e.positionTime
            self.player.seek(position: position)
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Change positions",
                                           isEnabled: isEnabled)
    }

    public func skipBackwardCommand(preferredIntervals: [NSNumber] = [15]) -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.skipBackwardCommand
        command.preferredIntervals = preferredIntervals
        let isEnabled: (MediaType) -> Bool = { $0 == .clip }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { event in
            guard
                let skipTime = (event as? MPSkipIntervalCommandEvent)?.interval
                else { return .commandFailed }

            let position = max(self.player.currentTime - skipTime, 0)
            self.player.seek(position: position)
            return .success
        }
        command.addTarget(handler: handler)
        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Skip backward",
                                           isEnabled: isEnabled)
    }

    public func skipForwardCommand(preferredIntervals: [NSNumber] = [30]) -> ModernAVPlayerRemoteCommand {
        let command = commandCenter.skipForwardCommand
        command.preferredIntervals = preferredIntervals
        let isEnabled: (MediaType) -> Bool = { $0 == .clip }
        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { event in
            guard
                let skipTime = (event as? MPSkipIntervalCommandEvent)?.interval
                else { return .commandFailed }

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
