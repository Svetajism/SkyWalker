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
                
                ScrollView(.vertical) {
                    
                    Text("My journey")
                        .font(Font.custom("VT323-Regular", size: 40))
                        .foregroundColor(.white)
                    
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
                        Image(systemName: "arrow.right")
                        Text("Start the timer")
                    })
                    .foregroundColor(.black)
                    .frame(minWidth: 300, minHeight: 40)
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color(red: 1, green: 0.39, blue: 0.06))
                    )
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
