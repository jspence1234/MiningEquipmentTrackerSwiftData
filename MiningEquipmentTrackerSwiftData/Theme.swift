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
            .blur(radius: 10)    // Slight blur to create a hazy, "cloudy" look
            .edgesIgnoringSafeArea(.all)
        }
    }
}

/// A "light glass" button style that keeps the same name
/// but now uses a frosted, transparent background appearance.
struct DarkTransparentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.black)  // Dark text on a lighter glass background
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    // Use white with slight opacity to simulate frosted glass
                    .fill(Color.white.opacity(configuration.isPressed ? 0.4 : 0.3))
                    .blur(radius: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.15), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 2, y: 2)
    }
}
