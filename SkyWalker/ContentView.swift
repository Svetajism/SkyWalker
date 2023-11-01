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
        GeometryReader{ screen in
            NavigationView  {
                NavigationLink(destination: PlanetsView().navigationBarBackButtonHidden()) {
                    ZStack {
                        
                        Home().ignoresSafeArea()
                        
                        VStack(spacing: 32) {
                            Text("SKY WALKER")
                                .font(Font.custom("VT323-Regular", size: 40))
                                .foregroundColor(Color(hex: "FF630F"))
                                .background(Color.black)
                            
                            Text("A journey of a thousand miles \nbegins with a single step")
                                .foregroundColor(.white)
                                .background(Color.black)
                                .font(Font.system(size: 16))
                        }
                        .frame(width: screen.size.width)
                        .padding()
                        .offset(y: -110)
                    }
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
