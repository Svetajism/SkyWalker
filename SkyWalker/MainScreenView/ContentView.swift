//
//  ContentView.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 24/10/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    var body: some View {
    
            ZStack {
    
                Home().ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("sky walker")
                        .foregroundColor(.white)
                        .background(Color.black)
                        .font(Font.custom("VT323-Regular", size: 35))

                    Text("A journey of a thousand miles begins with a single step")
                        .foregroundColor(.white)
                        .background(Color.black)
                        .font(.title3)
                }
                .padding()
            }
        }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
    
}
