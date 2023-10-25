//
//  VideoPlayerView.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 25/10/23.
//


import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let videoURL = createLocalUrl(for: "video", ofType: "mp4")

        let player = AVPlayer(url: videoURL!)
        player.isMuted = true
        player.play()
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: nil
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}

}

extension VideoPlayerView {

    func createLocalUrl(for filename: String, ofType: String) -> URL? {
        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(filename).\(ofType)")
        
        guard fileManager.fileExists(atPath: url.path) else {
            guard let video = NSDataAsset(name: filename)  else { return nil }
            fileManager.createFile(atPath: url.path, contents: video.data, attributes: nil)
            return url
        }
        
        return url
    }

}
