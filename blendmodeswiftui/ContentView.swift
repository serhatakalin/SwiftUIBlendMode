//
//  ContentView.swift
//  blendmodeswiftui
//
//  Created by serhat akalin on 24.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedBlendMode = BlendMode.overlay
    fileprivate let modes: [BlendMode] = [
            .overlay,
            .normal,
            .color,
            .colorBurn,
            .colorDodge,
            .darken,
            .difference,
            .exclusion,
            .hardLight,
            .luminosity,
            .hue,
            .multiply,
            .screen,
            .lighten,
            .destinationOut,
            .destinationOver,
            .sourceAtop,
            .saturation
    ]

    var body: some View {
        createImageUI()
        createModePicker()
    }
    
    //MARK: main image ui is being created.
    private func createImageUI() -> some View {
        ZStack(alignment: .leading) {
            Image("image")
                .resizable()
            
    //MARK: In order to apply the mod, a rectangular layer drawn on the image.
            Rectangle()
                .fill(Color.yellow)
                .blendMode(selectedBlendMode)
        }
            .frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
    }

    //MARK: created picker to change modes.
    private func createModePicker() -> some View {
        ZStack {
            Picker(selection: $selectedBlendMode, label: Text("Please choose a blend mode")) {
                ForEach(modes, id: \.self) { mode in
                    let mName: String = "\(mode)"
                    Text(mName)
                }
            }
                .frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
