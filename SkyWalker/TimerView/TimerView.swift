//
//  SwiftUIView.swift
//  skywalker v2
//
//  Created by Nurbek Baratov on 24/10/23.
//

import SwiftUI

struct TimerView: View {
    
    @State private var timeRemaining: Int = 25 * 60 // 25 minutes in seconds
    @State private var isRunning: Bool = false
    @State private var isPaused: Bool = false // New State for paused
    @State private var isBreakTime: Bool = false
    @State private var isBreakTimerRunning: Bool = false
    @State private var breakTimeRemaining: Int = 5 * 60 // 5 minutes in seconds
    @State private var showSkipAlert: Bool = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // Black background
                
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
                            Text("It's break time, buddy!")
                                .font(Font.custom("VT323-Regular", size: 35))
                                .foregroundColor(.white)
                                .padding(.top, 20)
                        }
                        else {
                            Text("FOCUS TIMER")
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
                                HStack {
                                    Image(systemName: "stop.fill")
                                        .foregroundColor(.white)
                                    Text("Skip")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 50)
                                .padding(.vertical, 15)
                            }
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 2))
                            .alert(isPresented: $showSkipAlert) {
                                Alert(title: Text("Did you really want to skip the break time?"),
                                      primaryButton: .default(Text("Yes"), action: {
                                          // Reset the states to show the main timer screen with the start button
                                          isBreakTime = false
                                          isBreakTimerRunning = false
                                          timeRemaining = 1 * 60
                                      }),
                                      secondaryButton: .cancel(Text("No")))
                            }

                            // Start Button
                            Button(action: {
                                        isBreakTimerRunning.toggle() // Toggle between start and pause
                                    }) {
                                        HStack {
                                            Image(systemName: isBreakTimerRunning ? "pause.fill" : "play.fill")
                                                .foregroundColor(.black)
                                            Text(isBreakTimerRunning ? "Pause" : "Start")
                                                .foregroundColor(.black)
                                        }
                                        .padding(.horizontal, 50)
                                        .padding(.vertical, 15)
                                    }
                                    .background(Color(hex: "FF630F"))
                                    .cornerRadius(15)
                                }
                                .padding(.bottom, 50)
                            }
                    
                    if isPaused { // Show Quit and Resume buttons when paused
                        HStack(spacing: 20) {
                            // Quit Button
                            Button(action: {
                                // Handle Quit action here
                            }) {
                                HStack {
                                    Image(systemName: "stop.fill")
                                        .foregroundColor(.white)
                                    Text("Quit")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 50)
                                .padding(.vertical, 15)
                            }
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 2))

                            // Resume Button
                            Button(action: {
                                isPaused = false
                                isRunning = true
                            }) {
                                HStack {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.black)
                                    Text("Resume")
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal, 50)
                                .padding(.vertical, 15)
                            }
                            .background(Color(hex: "FF630F"))
                            .cornerRadius(15)
                        }
                        .padding(.bottom, 50)

                        
                    }
                    

                    else {
                        if !isBreakTime {
                            
                            Button(action: {
                                if isRunning {
                                    isPaused = true
                                }
                                isRunning.toggle() // Toggles the timer on/off
                            }) {
                                HStack {
                                    Image(systemName: isRunning ? "pause.fill" : "play.fill")
                                        .foregroundColor(isRunning ? .white : .black)
                                    Text(isRunning ? "Pause" : "Start")
                                        .foregroundColor(isRunning ? .white : .black)
                                }
                            }
                            .padding(.horizontal, 150)
                            .padding(.vertical, 15)
                            .background(isRunning ? Color.clear : Color(hex: "FF630F"))
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(isRunning ? Color.white : Color(hex: "FF630F"), lineWidth: isRunning ? 2 : 0) // Add stroke for transparent button
                            )
                            .padding(.bottom, 50)
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
        HStack(spacing: 8) {
            Image(systemName: "chevron.left")
            Text("Back")
        }
        .foregroundColor(Color(hex: "FF630F"))
        .onTapGesture {
            // Action for back button here
        }
    }
}

struct SettingsButton: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .foregroundColor(Color(hex: "FF630F"))
            .onTapGesture {
                // Action for settings button here
            }
    }
}

struct ConcentrationTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
