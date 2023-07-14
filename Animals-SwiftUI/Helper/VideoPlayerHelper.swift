//
//  VideoPlayerHelper.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 11.07.2023.
//

import Foundation
import AVKit

final class VideoPlayerHelper {
    static var videoPlayer: AVPlayer?

    class func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
        if let videoURL = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
            videoPlayer = AVPlayer(url: videoURL)
            videoPlayer?.play()
        }
        return videoPlayer
    }
}
