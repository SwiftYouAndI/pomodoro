
//
//  ContentView.swift
//  Pomodoro
//
//  Created by Martin B.I. on 04.12.2023.
//

import SwiftUI

struct ContentView: View {
  private var timer = PomodoroTimer(workInSeconds: 10, breakInSeconds: 5)

  @State private var displayWarning = false
  @Environment(\.scenePhase) var scenePhase
  
  var body: some View {
    VStack {
      // circle
      CircleTimer(fraction: timer.fractionPassed, primaryText: timer.secondsLeftString, secondaryText: timer.mode.rawValue)
      
      // buttons
      HStack {
        // skip
        if timer.state == .idle && timer.mode == .pause {
          CircleButton(icon: "forward.fill") {
            timer.skip()
          }
        }
        // start
        if timer.state == .idle {
          CircleButton(icon: "play.fill") {
            timer.start()
          }
        }
        // resume
        if timer.state == .paused {
          CircleButton(icon: "play.fill") {
            timer.resume()
          }
        }
        // pause
        if timer.state == .running {
          CircleButton(icon: "pause.fill") {
            timer.pause()
          }
        }
        // reset
        if timer.state == .running || timer.state == .paused {
          CircleButton(icon: "stop.fill") {
            timer.reset()
          }
        }
      }
      // notification disabled warning
      if displayWarning {
        NotificationsDisabled()
      }
    }
    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    .background(
      RadialGradient(
        gradient: Gradient(colors: [Color("Light"), Color("Dark")]),
        center: .center,
        startRadius: 5,
        endRadius: 500
      )
    )
    .onChange(of: scenePhase) {
      if scenePhase == .active {
        PomodoroNotification.checkAuthorization { authorized in
          displayWarning = !authorized
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
