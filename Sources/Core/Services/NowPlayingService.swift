//
//  NowPlayingService.swift
//  RxAudioPlayerSM
//
//  Created by ankierman on 17/03/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

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
