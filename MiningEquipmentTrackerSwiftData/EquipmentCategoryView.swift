//
//  EquipmentCategoryView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 2/1/25.
//


import SwiftUI

struct EquipmentCategoryView: View {
    let equipmentTypes = ["Excavators", "Drills", "Conveyors"] // Example categories
    
    var body: some View {
        NavigationStack {
            List(equipmentTypes, id: \.self) { type in
                NavigationLink(destination: EquipmentListView(category: type)) {
                    Text(type)
                        .listTextStyle()
                }
            }
            .navigationTitle("Equipment Categories")
        }
    }
}