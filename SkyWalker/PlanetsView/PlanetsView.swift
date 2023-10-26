//
//  PlanetsView.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 25/10/23.
//

import SwiftUI

struct PlanetsView: View {

    
    let viewModel = PlanetsViewModel()
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            Text("MY JOURNEY")
                .font(Font.custom("VT323-Regular", size: 40))
                .foregroundColor(.white)
                .background(Color.black)
            
            VStack {
                ForEach(viewModel.planets) { planet in
                    PlanetCardView(model: planet)
                }
            }

        }
        .background(.black)
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
                .foregroundColor(.white)
                .padding(.bottom, 48)
            
   
            
            ForEach(allProgress) { _ in
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 8, height: 8)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                
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
