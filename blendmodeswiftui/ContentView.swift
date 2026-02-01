//
//  ContentView.swift
//  blendmodeswiftui
//
//  Created by serhat akalin on 24.01.2021.
//

import SwiftUI

// MARK: - Constants

private enum Constants {
    static let demoImageName = "image"
    static let pickerLabel = "Choose a blend mode"
}

// MARK: - BlendMode Extension

extension BlendMode {
    static var allCasesForPicker: [BlendMode] {
        [
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
    }
}

// MARK: - ContentView

@MainActor
struct ContentView: View {
    @State private var selectedBlendMode: BlendMode = .overlay
    
    var body: some View {
        VStack(spacing: 0) {
            BlendPreviewView(blendMode: selectedBlendMode)
            
            BlendModePicker(selection: $selectedBlendMode)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Subviews

@MainActor
private struct BlendPreviewView: View {
    let blendMode: BlendMode
    
    var body: some View {
        ZStack {
            Image(Constants.demoImageName)
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .fill(blendMode == .normal ? .clear : .yellow)
                .blendMode(blendMode)
        }
        .clipped()
        .animation(.easeInOut(duration: 0.2), value: blendMode)
        .aspectRatio(4/3, contentMode: .fit)
        .frame(maxWidth: .infinity)
    }
}

@MainActor
private struct BlendModePicker: View {
    @Binding var selection: BlendMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(Constants.pickerLabel)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Picker(Constants.pickerLabel, selection: $selection) {
                ForEach(BlendMode.allCasesForPicker, id: \.self) { mode in
                    Text(verbatim: String(describing: mode))
                        .tag(mode)
                }
            }
            .pickerStyle(.menu)
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Previews

#Preview {
    ContentView()
}
