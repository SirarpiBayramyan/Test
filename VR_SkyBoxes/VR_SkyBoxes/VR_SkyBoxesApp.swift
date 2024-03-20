//
//  VR_SkyBoxesApp.swift
//  VR_SkyBoxes
//
//  Created by Sirarpi Bayramyan on 11.03.24.
//

import SwiftUI

@main
struct VR_SkyBoxesApp: App {
  
  @ObservedObject var skyBoxSettings = SkyBoxSettings()

  var body: some Scene {
    ImmersiveSpace(id: "ImmersiveSpace") {
      ImmersiveView()
        .environmentObject(skyBoxSettings)
    }.immersionStyle(
      selection: .constant(.full),
      in: .full
    )

    WindowGroup(id: "SkyBoxControls") {
      SkyBoxControlsView()
        .environmentObject(skyBoxSettings)
    }
    .defaultSize(CGSize(width: 30, height: 30))
  }
}

class SkyBoxSettings: ObservableObject {
  @Published var currentSkyBox = ""
}
