//
//  PlanetsView.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 25/10/23.
//

import SwiftUI

struct PlanetsView: View {
    let viewModel = PlanetsViewModel()
    @State var showTimer = false
    var body: some View {
        if(showTimer){
            TimerView()
        }else{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        SettingsButton()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .frame(height: 30)
                    Spacer()
                    
                    Text("My journey")
                        .font(Font.custom("VT323-Regular", size: 34))
                        .foregroundColor(.white)
                        .padding()
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(viewModel.planets) { planet in
                                PlanetCardView(model: planet)
                            }
                        }
                    }.safeAreaInset(edge: .bottom, spacing: 0) {
                        Button(action: {
                            print("start")
                            showTimer = true
                        }, label: {
                            HStack {
                                Image(systemName: "arrow.right")
                                Text("Start the timer")
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .foregroundColor(.black)
                            .frame(width: 361, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color(red: 1, green: 0.39, blue: 0.06))
                            )
                        })
                    }
                }
            }
        }
    }
}


struct PlanetCardView: View {
    
    let model: PlanetModel
    let allProgress = PlanetsViewModel().planets
    
    var body: some View {
        VStack {
            Image(model.imageName)
                .padding(.bottom, 12)
            Text(model.name)
                .font(Font.custom("VT323-Regular", size: 24))
                .foregroundColor(.white)
                .padding(.bottom, 48)
            
   
            
            if(model.name != "Neptune"){
                ForEach(0..<12) { _ in
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 8, height: 8)
                        .foregroundColor(.white)
                        .padding(.top, 4)
                    
                }
            }
            
        }
        .padding(.vertical, 24)
    }
}

struct PlanetsView_Previews: PreviewProvider {

    static var previews: some View {
        PlanetsView()
    }
    
}
