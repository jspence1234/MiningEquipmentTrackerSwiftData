//
//  UserSession.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    // In a real app, store user roles or tokens here
}