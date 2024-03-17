//
//  SkyBoxControlsView.swift
//  VR_SkyBoxes
//
//  Created by Sirarpi Bayramyan on 11.03.24.
//

import SwiftUI

struct SkyBoxControlsView: View {
  
  @EnvironmentObject var skyBoxSettings: SkyBoxSettings

  var body: some View {
    HStack {
      SkyBoxButton(onClick: {
        skyBoxSettings.currentSkyBox = "forest"
      }, iconName: "tree")
      SkyBoxButton(onClick: {
        skyBoxSettings.currentSkyBox = "fantasy"
      }, iconName: "moon")

      SkyBoxButton(onClick: {
        skyBoxSettings.currentSkyBox = "river"
      }, iconName: "sun.min")

    }
  }
}

#Preview {
    SkyBoxControlsView()
}

struct SkyBoxButton: View {
  var onClick: () -> Void
  var iconName: String

  var body: some View {
    Button{
     onClick()
    }
  label: {
    Image(systemName: iconName)
  }
  }
}
