//
//  CustomVideoPlayer.swift
//  SkyWalker
//
//  Created by Isabella Di Lorenzi on 24/10/23.
//
import SwiftUI
import UIKit
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {

        let controller = AVPlayerViewController()
        player.isMuted = true
        player.play()
        controller.player = player
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: nil
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        
        controller.showsPlaybackControls = false
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
}
