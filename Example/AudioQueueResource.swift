//
//  AudioQueuResource.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 23/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import ModernAVPlayer

struct AudioQueueResource {

    static func remoteMedias() -> [ModernAVPlayerMedia] {
        let sampleAURL = URL(string: "https://freesound.org/data/previews/204/204341_1806892-lq.mp3")!
        let metaA = ModernAVPlayerMediaMetadata(title: "Sample A")
        let sampleA = ModernAVPlayerMedia(url: sampleAURL, type: .clip, metadata: metaA)

        let sampleBURL = URL(string: "https://freesound.org/data/previews/401/401190_5121236-lq.mp3")!
        let metaB = ModernAVPlayerMediaMetadata(title: "Sample B")
        let sampleB = ModernAVPlayerMedia(url: sampleBURL, type: .clip, metadata: metaB)

        let sampleCURL = URL(string: "https://freesound.org/data/previews/411/411849_7707368-lq.mp3")!
        let metaC = ModernAVPlayerMediaMetadata(title: "Sample C")
        let sampleC = ModernAVPlayerMedia(url: sampleCURL, type: .clip, metadata: metaC)
        return [sampleA, sampleB, sampleC]
    }

    static func localMedias() -> [ModernAVPlayerMedia] {
        let sampleAURL = getURL(resource: "SampleA", type: "mp3")
        let metaA = ModernAVPlayerMediaMetadata(title: "Sample A")
        let sampleA = ModernAVPlayerMedia(url: sampleAURL, type: .clip, metadata: metaA)

        let sampleBURL = getURL(resource: "SampleB", type: "mp3")
        let metaB = ModernAVPlayerMediaMetadata(title: "Sample B")
        let sampleB = ModernAVPlayerMedia(url: sampleBURL, type: .clip, metadata: metaB)

        let sampleCURL = getURL(resource: "SampleC", type: "mp3")
        let metaC = ModernAVPlayerMediaMetadata(title: "Sample C")
        let sampleC = ModernAVPlayerMedia(url: sampleCURL, type: .clip, metadata: metaC)
        return [sampleA, sampleB, sampleC]
    }

    static private func getURL(resource: String, type: String) -> URL {
        URL(fileURLWithPath: Bundle.main.path(forResource: resource, ofType: type)!)
    }
}
