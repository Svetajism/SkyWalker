//
//  ContentView.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 24/10/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
            ZStack {
                VideoPlayerView()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack(spacing: 20) {
                    Text("sky walker")
                        .foregroundColor(.white)
                        .background(Color.black)
                        .font(.title)
                    Text("A journey of a thousand miles begins with a single step")
                        .foregroundColor(.white)
                        .background(Color.black)
                        .font(.title3)
                }
                .padding()
            }
        }

}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
