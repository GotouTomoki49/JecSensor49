//
//  SensorView.swift
//  JecSensor49
//
//  Created by cmStudent on 2022/08/30.
//

import SwiftUI
import RealityKit

struct SensorView: View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        // RealityKitのメインビュー
        let arView = ARView(frame: .zero)
        
        // デバッグ用設定
        // 処理の統計情報と、検出した3D空間の特徴点を表示
        arView.debugOptions = [.showStatistics, .showFeaturePoints]
        
        // シーンにアンカーを追加する
        let anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.15, 0.15])
        arView.scene.anchors.append(anchor)
        
        // 表示するテキスト
        let textMesh = MeshResource.generateText(
            "日専祭",
            extrusionDepth: 2.0,
            font: .systemFont(ofSize: 2.0),
            containerFrame: CGRect.zero,
            alignment: .left,
            lineBreakMode: .byTruncatingTail)
        
        // 環境マッピングするマテリアルを設定
        //Color-Orange
        let textMaterial = SimpleMaterial(color: UIColor.orange, roughness: 0.0, isMetallic: true)
        let textModel = ModelEntity(mesh: textMesh, materials: [textMaterial])
        textModel.scale = SIMD3<Float>(0.1, 0.1, 0.1) // 10分の1に縮小
        textModel.position = SIMD3<Float>(0.0, 0.0, -0.2) // 奥0.2m
        anchor.addChild(textModel)
        
        //箱を作成
        //0.03サイズ
        let boxMesh = MeshResource.generateBox(size: 0.03)
        
        //単色の設定
        //Color-blue
        let boxMaterial = UnlitMaterial(color: UIColor.blue)
        let boxModel = ModelEntity(mesh: boxMesh, materials: [boxMaterial])
        // 左0.2m
        boxModel.position = SIMD3<Float>(-0.2, 0.0, 0.0)
        anchor.addChild(boxModel)
        
        // 球体を作成
        //0.03サイズ
        let sphereMesh = MeshResource.generateSphere(radius: 0.03)
        
        // 環境マッピングするマテリアルを設定
        //Color-green
        let sphereMaterial = SimpleMaterial(color: UIColor.green, roughness: 0.0, isMetallic: true)
        let sphereModel = ModelEntity(mesh: sphereMesh, materials: [sphereMaterial])
        sphereModel.position = SIMD3<Float>(0.0, 0.0, 0.0)
        anchor.addChild(sphereModel)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView()
    }
}
