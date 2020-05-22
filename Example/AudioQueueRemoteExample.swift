//
//  QueueAudioRemoteCommandFactoryExample.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 23/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MediaPlayer
import ModernAVPlayer

final class AudioQueueRemoteExample {

    // MARK: - Output

    /// Return all factory commands
    ///
    var defaultCommands: [ModernAVPlayerRemoteCommand] {
        return [playCommand,
                pauseCommand,
                stopCommand,
                togglePlayPauseCommand,
                prevTrackCommand,
                nextTrackCommand
        ]
    }

    // MARK: - Inputs

    private unowned let player: ModernAVPlayerExposable
    private let commandCenter: MPRemoteCommandCenter
    private let library: AudioQueueLibrary

    var selectedMediaIndexChanged: ((String) -> Void)?

    // MARK: - Init

    init(player: ModernAVPlayerExposable,
                commandCenter: MPRemoteCommandCenter = MPRemoteCommandCenter.shared(),
                library: AudioQueueLibrary) {
        self.player = player
        self.commandCenter = commandCenter
        self.library = library
    }

    // MARK: - Playback Commands

    /// Default play command
    ///
    lazy var playCommand: ModernAVPlayerRemoteCommand = {
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
    }()

    /// Default toggle play pause command
    ///
    lazy var togglePlayPauseCommand: ModernAVPlayerRemoteCommand = {
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
    }()

    /// Default pause command
    ///
    lazy var pauseCommand: ModernAVPlayerRemoteCommand = {
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
    }()

    /// Default stop command
    ///
    lazy var stopCommand: ModernAVPlayerRemoteCommand = {
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
    }()

    // MARK: - Navigating between tracks

    /// Previous Track Command
    /// Not enabled yet
    ///
    lazy var prevTrackCommand: ModernAVPlayerRemoteCommand = {
        let command = commandCenter.previousTrackCommand
        let isEnabled: (MediaType) -> Bool = { _ in true }

        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { [weak self] _ in
            guard let self = self else { return .commandFailed }
            self.library.selectedMediaIndex -= 1
            let index = abs(self.library.selectedMediaIndex % self.library.dataSource.count)
            let media = self.library.dataSource[index]
            self.player.load(media: media, autostart: true, position: nil)
            self.selectedMediaIndexChanged?(index.description)
            return .success
        }
        command.addTarget(handler: handler)

        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Prev track",
                                           isEnabled: isEnabled)
    }()

    /// Next Track Command
    /// Not enabled yet
    ///
    lazy var nextTrackCommand: ModernAVPlayerRemoteCommand = {
        let command = commandCenter.nextTrackCommand
        let isEnabled: (MediaType) -> Bool = { _ in true }

        let handler: (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus = { [weak self] _ in
            guard let self = self else { return .commandFailed }
            self.library.selectedMediaIndex += 1
            let index = abs(self.library.selectedMediaIndex % self.library.dataSource.count)
            let media = self.library.dataSource[index]
            self.player.load(media: media, autostart: true, position: nil)
            self.selectedMediaIndexChanged?(index.description)
            return .success
        }
        command.addTarget(handler: handler)

        return ModernAVPlayerRemoteCommand(reference: command,
                                           debugDescription: "Next track",
                                           isEnabled: isEnabled)
    }()
}
