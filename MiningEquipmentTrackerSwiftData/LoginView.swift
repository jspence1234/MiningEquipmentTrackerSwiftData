//
//  LoginView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userSession: UserSession
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            VStack(spacing: 20) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                Button("Login") {
                    // Mock logic
                    userSession.isLoggedIn = true
                }
                .buttonStyle(DarkTransparentButtonStyle())
                .padding(.top, 20)
            }
            .padding(.bottom, 100)
        }
    }
}