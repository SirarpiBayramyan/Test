//
//  ImmersiveView.swift
//  VR_SkyBoxes
//
//  Created by Sirarpi Bayramyan on 11.03.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

  @EnvironmentObject var skyBoxSettings: SkyBoxSettings
  @Environment(\.openWindow) private var openWindow

    var body: some View {
        RealityView { content in
          guard let skyBoxEntity = createSkyBox() else {
            return
          }
          content.add(skyBoxEntity)
        } update: { content in
          updateSkyBox(
            with: skyBoxSettings.currentSkyBox,
            content: content
          )
        }
        .onAppear(perform: {
          openWindow(id: "SkyBoxControls")
        })
    }

  private func createSkyBox() -> Entity?{
    // Mesh (large sphere)
    let skyBoxMesh = MeshResource.generateSphere(radius: 1000)

    // Material (skyBox image)
    var skyBoxMaterial = UnlitMaterial()
    guard let skyBoxTexture = try? TextureResource.load(named: "forest") else {
      return nil
    }
    skyBoxMaterial.color = .init(
      texture: .init(skyBoxTexture)
    )

    // Entity
    let skyBoxEntity = Entity()
    skyBoxEntity.components.set(
      ModelComponent(
        mesh: skyBoxMesh,
        materials: [skyBoxMaterial]
      )
    )

    skyBoxEntity.name = "SkyBox"

    //image inner surface of sphere
    skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)

    return skyBoxEntity
  }

  private func updateSkyBox(
    with newSkyBoxName: String,
    content: RealityViewContent
  ) {
    let skyBoxEntity = content.entities.first { entity in
      entity.name == "SkyBox"
    }
    guard let updatedSkyBoxTexture = try? TextureResource.load(named:newSkyBoxName ) else {
      return
    }
    var updatedSkyBoxMaterial = UnlitMaterial()
    updatedSkyBoxMaterial.color = .init(texture: .init(updatedSkyBoxTexture))
    skyBoxEntity?.components.set(
      ModelComponent(
        mesh: MeshResource.generateSphere(radius: 1000),
        materials: [updatedSkyBoxMaterial]
      )
    )
  }

}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
