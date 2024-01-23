//
//  NotificationsDisabled.swift
//  Pomodoro
//
//  Created by Martin B.I. on 07.12.2023.
//

import SwiftUI

struct NotificationsDisabled: View {
  var body: some View {
    VStack {
      Text("Notifications are disabled")
        .font(.headline)
      Text("To be notified when a pomodoro period is over, enable notifications.")
        .font(.subheadline)
      Button("Open Settings") {
        openSettings()
      }
      .buttonStyle(.bordered)
    }
    .padding()
    .background(Color("Light"))
    .foregroundColor(Color("Dark"))
    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    .padding(.vertical)
  }
  
  private func openSettings() {
    // must execute in main thread
    DispatchQueue.main.async {
      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:],
                                completionHandler: nil)
    }
  }
}

#Preview {
  VStack {
    NotificationsDisabled()
  }
  .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
  .background(Color("Dark"))
  
}
