//
//  CustomDialog.swift
//  SkyWalker
//
//  Created by Nurbek Baratov on 30/10/23.
//

import SwiftUI

struct CustomDialog: View {
    @Binding var isActive: Bool

    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> ()
    @State private var offset: CGFloat = 1000

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                

            VStack(spacing: 20) {
                // Title Text
                Text("Congratulations!")
                    .font(Font.custom("VT323", size: 34))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 361, alignment: .top)

                // Message Text
                Text("You just spent focusing your first 25 minutes and arrived on Mercury")
                    .font(Font.custom("VT323", size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 313, alignment: .top)

                // Planet Image (Placeholder, since the image wasn't provided)
                Image("01_Mercury") // Replace with your planet image
                    .resizable()
                    .frame(width: 144, height: 144) // Adjust to your image's size
                    

                // Button
                HStack(alignment: .center, spacing: 4) {
                    Text(buttonTitle)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .frame(width: 313, alignment: .center)
                .background(Color(red: 1, green: 0.39, blue: 0.06))
                .cornerRadius(24)
                .onTapGesture {
                   
                    close()
                }
            }
            .padding(30)
            .background(
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 361, height: 483)
                    .background(.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .inset(by: 0.5)
                            .stroke(.white, lineWidth: 1)
                    )
            )
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }

    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

struct CustomDialog_Previews: PreviewProvider {
    static var previews: some View {
        CustomDialog(isActive: .constant(true), title: "Congratulations!", message: "You just spent focusing your first 25 minutes and arrived on Mercury", buttonTitle: "Got it", action: {})
    }
}
