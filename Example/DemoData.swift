//
//  DemoData.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 12/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import ModernAVPlayer

struct DemoData {

    struct InvalidMediaError: Error { }

    static let medias: [PlayerMedia] = {
        guard
            let liveUrl = URL(string: "http://direct.franceinter.fr/live/franceinter-midfi.mp3"),
            let remoteClip = URL(string: "http://media.radiofrance-podcast.net/podcast09/13100-17.01.2017-ITEMA_21199585-0.mp3"),
            let file = Bundle.main.path(forResource: "AllNew", ofType: "mp3")
            else { assertionFailure(); return [] }

        let localClip = URL(fileURLWithPath: file)

        let meta0 = ModernAVPlayerMediaMetadata(title: "Le live",
                                                albumTitle: "Album0",
                                                artist: "Artist0",
                                                image: UIImage(named: "sennaLive")?.jpegData(compressionQuality: 1.0))

        let meta1 = ModernAVPlayerMediaMetadata(title: "Remote clip",
                                                albumTitle: "Album1",
                                                artist: "Artist1",
                                                image: nil)

        let meta2 = ModernAVPlayerMediaMetadata(title: "Local clip",
                                                albumTitle: "Album2",
                                                artist: "Artist2",
                                                image: UIImage(named: "ankierman")?.jpegData(compressionQuality: 1.0),
                                                remoteImageUrl: URL(string: "https://goo.gl/U4QoQj"))
        return [
            ModernAVPlayerMedia(url: liveUrl, type: .stream(isLive: true), metadata: meta0),
            ModernAVPlayerMedia(url: remoteClip, type: .clip, metadata: meta1),
            ModernAVPlayerMedia(url: localClip, type: .clip, metadata: meta2)
        ]
    }()

    static let invalidMedia: PlayerMedia = {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "noreason", ofType: "txt")!)
        return ModernAVPlayerMedia(url: url, type: .clip, metadata: nil)
    }()

    static func media(with liveUrlString: String?) throws -> PlayerMedia {
        guard
            let liveUrl = URL(string: liveUrlString ?? "")
            else { throw DemoData.InvalidMediaError() }

        let meta = ModernAVPlayerMediaMetadata(title: "Custom Url live",
                                               albumTitle: "Album0",
                                               artist: "Artist0",
                                               image: UIImage(named: "sennaLive")?.jpegData(compressionQuality: 1.0))

        return ModernAVPlayerMedia(url: liveUrl, type: .stream(isLive: true), metadata: meta)
    }
}
