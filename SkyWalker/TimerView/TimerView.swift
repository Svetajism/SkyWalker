//
//  SwiftUIView.swift
//  skywalker v2
//
//  Created by Nurbek Baratov on 24/10/23.
//

import SwiftUI

struct TimerView: View {
    
    @State private var timeRemaining: Int = 25 * 1 // 25 minutes in seconds
    @State private var isRunning: Bool = false
    @State private var isPaused: Bool = false // New State for paused
    @State private var isBreakTime: Bool = false
    @State private var isBreakTimerRunning: Bool = false
    @State private var breakTimeRemaining: Int = 5 * 60 // 5 minutes in seconds
    @State private var showSkipAlert: Bool = false
    @State private var showAlert: Bool = false
    @State private var showCustomDialog: Bool = false



    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // Black background
                
                // Inside the ZStack
                if showCustomDialog {
                    CustomDialog(isActive: $showCustomDialog, title: "CONGRATULATIONS!", message: "You just spent focusing your first 25 minutes and arrived on Mercury", buttonTitle: "Got it") {
                        // This is the action you want to perform when the button inside the dialog is pressed. For now, it'll just start the break timer.
                        isBreakTimerRunning = true
                    }
                }

                
                
                if !showCustomDialog {
                    if isRunning {
                        Home().ignoresSafeArea()
                    }
                    VStack {
                        if !isRunning && !isPaused && !isBreakTimerRunning {
                            HStack {
                                BackButton()
                                Spacer()
                                SettingsButton()
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                            .frame(height: 50)
                            
                            if isBreakTime {
                                Text("It's break time \nbuddy!")
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("VT323-Regular", size: 35))
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                            }
                            else {
                                Text("Focus Timer")
                                    .font(Font.custom("VT323-Regular", size: 40))
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                            }
                        }
                        
                        Spacer()
                        
                        Text(isBreakTime ? String(format: "%02d:%02d", breakTimeRemaining/60, breakTimeRemaining%60) : String(format: "%02d:%02d", timeRemaining/60, timeRemaining%60))
                        
                            .font(Font.custom("VT323-Regular", size: 120))
                            .foregroundColor(.white)
                            .padding(.top, (isRunning || isPaused || isBreakTimerRunning) ? 0 : -100)
                        
                        Spacer()
                        
                        if isBreakTime {
                            HStack(spacing: 20) {
                                
                                // Skip Button
                                Button(action: {
                                    showSkipAlert = true
                                }) {
                                    HStack(alignment: .center, spacing: 4) {
                                        Image(systemName: "stop.fill")
                                            .foregroundColor(.white)
                                        Text("Skip")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 14)
                                    .frame(width: 172, alignment: .center)
                                    .background(Color.black)
                                    .cornerRadius(24)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 24)
                                            .inset(by: 0.5)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                                }
                                .alert(isPresented: $showSkipAlert) {
                                    Alert(title: Text("Do you want to skip break time?"),
                                          primaryButton: .default(Text("Yes"), action: {
                                        // Reset the states to show the main timer screen with the start button
                                        isBreakTime = false
                                        isBreakTimerRunning = false
                                        timeRemaining = 25 * 60
                                    }),
                                          secondaryButton: .cancel(Text("No")))
                                }
                                
                                // Start Button
                                Button(action: {
                                    isBreakTimerRunning.toggle() // Toggle between start and pause
                                }) {
                                    HStack(alignment: .center, spacing: 4) {
                                        Image(systemName: isBreakTimerRunning ? "pause.fill" : "play.fill")
                                            .foregroundColor(.black)
                                        Text(isBreakTimerRunning ? "Pause" : "Start")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 14)
                                    .frame(width: 172, alignment: .center)
                                    .background(Color(red: 1, green: 0.39, blue: 0.06))
                                    .cornerRadius(24)
                                }
                                
                            }
                            .padding(.bottom, 64)
                        }
                        
                        
                        if isPaused { // Show Quit and Resume buttons when paused
                            HStack(spacing: 17) {
                                NavigationLink(destination: PlanetsView().navigationBarBackButtonHidden()) {
                                    
                                    HStack(alignment: .center, spacing: 4) {
                                        Image(systemName: "stop.fill")
                                            .foregroundColor(.white)
                                        Text("Quit")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 14)
                                    .frame(width: 172, alignment: .center)
                                    .background(RoundedRectangle(cornerRadius: 24).stroke(Color.white, lineWidth: 1))
                                    .cornerRadius(24)
                                }
                                
                                
                                // Resume Button
                                Button(action: {
                                    isPaused = false
                                    isRunning = true
                                }) {
                                    HStack(alignment: .center, spacing: 4) {
                                        Image(systemName: "play.fill")
                                            .foregroundColor(.black)
                                        Text("Resume")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 14)
                                    .frame(width: 172, alignment: .center)
                                    .background(Color(red: 1, green: 0.39, blue: 0.06))
                                    .cornerRadius(24)
                                }
                            }
                            .padding(.bottom, 64)
                        }
                        
                        else {
                            // Check if it's not break time
                            if !isBreakTime {
                                Button(action: {
                                    if isRunning { isPaused = true }
                                    isRunning.toggle()
                                }) {
                                    HStack(alignment: .center, spacing: 4) {
                                        Image(systemName: isRunning ? "pause.fill" : "play.fill")
                                            .foregroundColor(isRunning ? .white : .black)
                                        Text(isRunning ? "Pause" : "Start")
                                            .foregroundColor(isRunning ? .white : .black)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 14)
                                    .frame(width: 361, alignment: .center)
                                    .background(isRunning ? Color.clear : Color(hex: "FF630F"))
                                    .cornerRadius(24)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(isRunning ? Color.white : Color(hex: "FF630F"), lineWidth: isRunning ? 1 : 0)
                                    )
                                }
                                .padding(.bottom, 64)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("CONCENTRATION TIMER", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
        .onReceive(timer) { _ in
            if isRunning && timeRemaining > 0 {
                timeRemaining -= 1
            }

            if timeRemaining == 0 && !isBreakTime {
                showCustomDialog = true
                isRunning = false
                isBreakTime = true
            }

            if isBreakTimerRunning && isBreakTime && breakTimeRemaining > 0 {
                breakTimeRemaining -= 1
            }
        }

    }
}

struct BackButton: View {
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


struct SettingsButton: View {
    var body: some View {
        NavigationLink(destination: StatsView().navigationBarBackButtonHidden(true)) {
            Image(systemName: "person.circle.fill")
                .foregroundColor(Color(hex: "FF630F"))
                
        }
    }
}

struct ConcentrationTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
