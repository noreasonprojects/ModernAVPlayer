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

//sourcery: AutoMockable
protocol NowPlaying {
    func update(metadata: PlayerMediaMetadata?, duration: Double?, isLive: Bool?)
    func overrideInfoCenter(for key: String, value: Any)
}

/*
 Because of race condition, we have to share infos property when updating
 */

final class ModernAVPlayerNowPlayingService: NowPlaying {

    private var infos = [String: Any]()
    private var session: URLSession { return URLSession.shared }
    private var task: URLSessionTask?

    func update(metadata: PlayerMediaMetadata?, duration: Double?, isLive: Bool?) {
        infos[MPMediaItemPropertyTitle] = metadata?.title ?? ""
        infos[MPMediaItemPropertyArtist] = metadata?.artist ?? ""
        infos[MPMediaItemPropertyAlbumTitle] = metadata?.albumTitle ?? ""
        infos[MPNowPlayingInfoPropertyPlaybackRate] = 1.0

        if let imageData = metadata?.image, let image = UIImage(data: imageData) {
            let artwork = getArtwork(image: image)
            infos[MPMediaItemPropertyArtwork] = artwork
        } else {
            infos.removeValue(forKey: MPMediaItemPropertyArtwork)
        }

        if let imageUrl = metadata?.remoteImageUrl {
            updateRemoteImage(url: imageUrl)
        }

        if let isLive = isLive {
            infos[MPNowPlayingInfoPropertyIsLiveStream] = isLive
        }

        if let duration = duration, duration.isNormal {
            infos[MPMediaItemPropertyPlaybackDuration] = duration
        } else {
            infos.removeValue(forKey: MPMediaItemPropertyPlaybackDuration)
        }

        MPNowPlayingInfoCenter.default().nowPlayingInfo = infos

        ModernAVPlayerLogger.instance.log(message: "Update now playing dictionnary", domain: .service)
    }
    
    func overrideInfoCenter(for key: String, value: Any) {
        infos[key] = value
        MPNowPlayingInfoCenter.default().nowPlayingInfo = infos
        ModernAVPlayerLogger.instance.log(message: "Update nowPlayingInfo \(key):\(value)", domain: .service)
    }

    private func getArtwork(image: UIImage) -> MPMediaItemArtwork {
        return MPMediaItemArtwork(boundsSize: image.size) { _ in image }
    }

    private func updateRemoteImage(url: URL) {
        task?.cancel()
        task = session.dataTask(with: url) { [weak self] data, _, _ in
            guard let imageData = data, let image = UIImage(data: imageData), let artwork = self?.getArtwork(image: image) else { return }
            self?.overrideInfoCenter(for: MPMediaItemPropertyArtwork, value: artwork)
        }
        task?.resume()
    }
}
