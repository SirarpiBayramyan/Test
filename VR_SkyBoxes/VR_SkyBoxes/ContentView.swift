//
//  ContentView.swift
//  VR_SkyBoxes
//
//  Created by Sirarpi Bayramyan on 11.03.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {

            Text("Hello, world!")

        }
        .padding()

    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
