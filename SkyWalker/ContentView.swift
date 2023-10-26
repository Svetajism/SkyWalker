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
        NavigationView  {
            NavigationLink(destination: PlanetsView()) {
                ZStack {
                    
                    Home().ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("SKY WALKER")
                            .font(Font.custom("VT323-Regular", size: 40))
                            .foregroundColor(.white)
                            .background(Color.black)
                        
                        Text("A journey of a thousand miles begins with a single step")
                            .foregroundColor(.white)
                            .background(Color.black)
                            .font(Font.custom("VT323-Regular", size: 35))
                    }
                    .padding()
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
    
}