//
//  Home.swift
//  SkyWalker
//
//  Created by Isabella Di Lorenzi on 24/10/23.
//

import SwiftUI
import AVKit

struct Home: View {

    @State private var player: AVPlayer? = {
        if let bundle = Bundle.main.path(forResource: "output2", ofType: "mov") {
            return.init(url:URL(filePath: bundle))
        }
        return nil
    } ()

    var body: some View {
        VStack(spacing: 0) {

            ZStack {
                if let player {
                    CustomVideoPlayer(player: player).onAppear() {
                        player.play()
                    }.aspectRatio(contentMode: .fill)
                }
            }

        }
    }

}
