//
//  Theme.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//

import SwiftUI

/// A light, cloud-like gradient background
/// with a subtle blur for a "glass" effect.
struct SpaceGradientBackground: View {
    var body: some View {
        ZStack {
            // A soft, pastel gradient reminiscent of cloudy skies
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.97, blue: 1.0).opacity(0.9),
                    Color.white.opacity(0.8)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blur(radius: 10)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

/// Updated List Text Style
struct ListTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2) // Larger font for better readability
            .foregroundColor(.black) // Improve contrast
            .padding(.vertical, 4)
    }
}

extension View {
    func listTextStyle() -> some View {
        self.modifier(ListTextStyle())
    }
}

/// Button style for dark, transparent buttons
struct DarkTransparentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(configuration.isPressed ? 0.4 : 0.6))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
