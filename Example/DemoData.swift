// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// DemoData.swift
// Created by raphael ankierman on 12/10/2019.
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


import ModernAVPlayer

struct DemoData {

    struct InvalidMediaError: Error { }

    let medias: [PlayerMedia] = {
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

    let invalidMedia: PlayerMedia = {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "noreason", ofType: "txt")!)
        return ModernAVPlayerMedia(url: url, type: .clip, metadata: nil)
    }()

    func media(with liveUrlString: String?) throws -> PlayerMedia {
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
