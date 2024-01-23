//
//  TimerDemo.swift
//  Pomodoro
//
//  Created by Martin B.I. on 05.12.2023.
//

import SwiftUI

struct TimerDemo: View {
  private var timer: PomodoroTimer = PomodoroTimer(workInSeconds: 10, breakInSeconds: 5)
  
  var body: some View {
    Text("\(timer.secondsLeft)")
    Text("\(timer.secondsLeftString)")
    Text("\(timer.mode.rawValue)")
    
    if timer.state == .idle {
      Button("start") {
        timer.start()
      }
    }
    if timer.state == .running {
      Button("pause") {
        timer.pause()
      }
    }
    if timer.state == .paused {
      Button("resume") {
        timer.resume()
      }
    }
  }
}

#Preview {
  TimerDemo()
}
