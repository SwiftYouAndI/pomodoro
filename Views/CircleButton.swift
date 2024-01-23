//
//  CircleButton.swift
//  Pomodoro
//
//  Created by Martin B.I. on 07.12.2023.
//

import SwiftUI

struct CircleButton: View {
  let icon: String
  let action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label : {
      Image(systemName: icon)
        .foregroundColor(Color("Light"))
        .frame(width: 60, height: 60)
        .background(Color("Dark")).opacity(0.5)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
  }
}

#Preview {
  CircleButton(icon: "play.fill") {
    print("hello")
  }
}
