//
//  AudioManager.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import AVFoundation

final class AudioManager {

    private var player: AVPlayer?

    func pause() {
        player?.pause()
    }

    func play(url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }
}
