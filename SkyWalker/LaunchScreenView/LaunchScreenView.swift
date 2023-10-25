//
//  LaunchScreenView.swift
//  SkyWalker
//
//  Created by Svetlana Shardakova on 25/10/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        Image("Launch/stars")
            .edgesIgnoringSafeArea(.top)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
