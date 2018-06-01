// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// NowPlayingService.swift
// Created by raphael ankierman on 17/03/2018.
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

/*
 Because of race condition, we have to share infos property when updating
 */

protocol NowPlaying {
    func update(media: PlayerMedia, duration: Double?)
    func overrideInfoCenter(for key: String, value: Any)
}

final class ModernAVPlayerNowPlayingService: NowPlaying {

    private var infos = [String: Any]()
    private var session: URLSession {
        return URLSession.shared
    }
    private var task: URLSessionTask?

    func update(media: PlayerMedia, duration: Double?) {
        infos = parseInfos(media: media, duration: duration)
        MPNowPlayingInfoCenter.default().nowPlayingInfo = infos
    }

    func overrideInfoCenter(for key: String, value: Any) {
        infos[key] = value
        MPNowPlayingInfoCenter.default().nowPlayingInfo = infos
    }

    private func updateRemoteImage(url: URL) {
        task?.cancel()
        task = session.dataTask(with: url) { [weak self] data, _, _ in
            guard let imageData = data, let image = UIImage(data: imageData) else { return }

            let artwork = MPMediaItemArtwork(image: image)
            self?.overrideInfoCenter(for: MPMediaItemPropertyArtwork, value: artwork)
        }
        task?.resume()
    }

    private func parseInfos(media: PlayerMedia, duration: Double?) -> [String: Any] {
        var infos = [String: Any]()
        infos[MPMediaItemPropertyTitle] = media.title ?? " "
        infos[MPMediaItemPropertyArtist] = media.artist ?? " "
        infos[MPMediaItemPropertyAlbumTitle] = media.albumTitle ?? " "
        infos[MPMediaItemPropertyPlaybackDuration] = duration ?? 0
        infos[MPNowPlayingInfoPropertyPlaybackRate] = 1.0
        if #available(iOS 10, *) {
            infos[MPNowPlayingInfoPropertyIsLiveStream] = media.isLive
        }

        if let imageName = media.localPlaceHolderImageName, let image = UIImage(named: imageName) {
            let artwork = MPMediaItemArtwork(image: image)
            infos[MPMediaItemPropertyArtwork] = artwork
        }

        if let imageUrl = media.remoteImageUrl {
            updateRemoteImage(url: imageUrl)
        }

        return infos
    }
}
