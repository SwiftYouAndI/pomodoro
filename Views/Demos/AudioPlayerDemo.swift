//
//  SwiftUIView.swift
//  Pomodoro
//
//  Created by Martin B.I. on 04.12.2023.
//

import SwiftUI

struct AudioPlayerDemo: View {
  var audioPlayer = PomodoroAudio()
  
  var body: some View {
    VStack {
      Button("play done") {
        audioPlayer.play(.done)
      }
      Button("play tick") {
        audioPlayer.play(.tick)
      }
    }
  }
}

#Preview {
  AudioPlayerDemo()
}
