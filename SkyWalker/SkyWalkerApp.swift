//
//  SkyWalkerApp.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 24/10/23.
//

import SwiftUI

@main
struct SkyWalkerApp: App {

    @State private var isShowingMainView = false
    
    var body: some Scene {
        WindowGroup {
            if isShowingMainView {
                ContentView()
            } else {
                LaunchScreenView()
                    .onAppear {
                        // Wait for 2 seconds before transitioning to the main view
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isShowingMainView = true
                            }
                        }
                    }
            }
        }
    }

}
