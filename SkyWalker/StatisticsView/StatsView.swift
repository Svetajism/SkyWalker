//
//  StatsView.swift
//  SkyWalker
//
//  Created by Nurbek Baratov on 01/11/23.
//

import SwiftUI

struct StatsView: View {
    let planets: [PlanetModel] = PlanetsViewModel().planets
    @State var focusMinutes: Int = 1025
    @State var restMinutes: Int = 75
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    MyJourneyButton()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 1)
                .frame(height: 40)
                .background(Color.clear)
                Spacer()
                
                ScrollView(.vertical) {
                    VStack(alignment: .center, spacing: 16) {
                        HStack(alignment: .center, spacing: 16) {
                            // Focus Minutes VStack
                            VStack {
                                VStack(alignment: .center) {
                                    Text(String(focusMinutes))
                                        .font(Font.custom("VT323-Regular", size: 52))
                                        .foregroundColor(Color(hex: "FF630F"))
                                }
                                .padding(24)
                                .frame(width: 173, alignment: .center)
                                .background(Color.clear)
                                .cornerRadius(24)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .inset(by: 0.5)
                                        .stroke(.white, lineWidth: 1)
                                )
                                Text("Focus Minutes")
                                    .font(Font.custom("VT323-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                            VStack {
                                VStack(alignment: .center) {
                                    Text(String(restMinutes))
                                        .font(Font.custom("VT323-Regular", size: 52))
                                        .foregroundColor(Color(hex: "FF630F"))
                                    
                                }
                                .padding(24)
                                .frame(width: 173, alignment: .center)
                                .background(Color.clear)
                                .cornerRadius(24)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .inset(by: 0.5)
                                        .stroke(.white, lineWidth: 1)
                                )
                                Text("Rest Minutes")
                                    .font(Font.custom("VT323-Regular", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        
                        Text("Achievements")
                            .font(Font.custom("VT323-Regular", size: 34))
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        Spacer()
                        
                        ForEach(planets) { planet in
                            AchievementCard(model: planet)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct AchievementCard: View {
    let model: PlanetModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 11) {
            
            // Planet Image in a smaller rectangle
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 144, height: 144)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .inset(by: 0.5)
                            .stroke(Color.white, lineWidth: 1)
                    )

                Image(model.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 72, height: 72)
            }
            
            // Text and Progress Bar
            VStack(alignment: .leading, spacing: 8) {
                Text(model.name)
                    .font(Font.custom("VT323-Regular", size: 24))
                    .foregroundColor(.white)
                
                Text("Complete your first \(model.currentProgres) minutes")
                    .font(Font.system(size: 14))
                    .foregroundColor(.white)
                Spacer()
                
                // Progress bar
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.clear)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 1) // You can change the color and lineWidth as per your need
                                )
                        .frame(height: 12)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "FF630F"))
                        .frame(width: CGFloat(188 / 188) * 100, height: 12)
                }
                .frame(width: 188, height: 12)
                

                
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 19)
        .padding(.bottom, 19) // Adjust bottom padding to align the sides
        .frame(width: 361, height: 144) // Adjusted width to fit content
        .background(Color.black)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .inset(by: 0.5)
                .stroke(Color.white, lineWidth: 1)
        )
    }
}

struct MyJourneyButton: View {
    var body: some View {
        NavigationLink(destination: PlanetsView().navigationBarBackButtonHidden(true)) {
            HStack(spacing: 8) {
                Image(systemName: "chevron.left")
                Text("My Journey")
            }
            .foregroundColor(Color(hex: "FF630F"))
        }
    }
}


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
