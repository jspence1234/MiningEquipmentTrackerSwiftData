//
//  EquipmentDetailView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//

import SwiftUI
import SwiftData

struct EquipmentDetailView: View {
    @Environment(\.modelContext) private var context
    
    // Use @Bindable to edit the SwiftData model directly
    @Bindable var equipment: Equipment

    var body: some View {
        Form {
            Section {
                // Binding non-optional properties directly
                TextField("Equipment #", text: $equipment.equipmentNumber)
                
                // For optional properties, provide default binding
                TextField("Model", text: Binding($equipment.model, default: ""))
                TextField("Serial Number", text: Binding($equipment.serialNumber, default: ""))
                TextField("Status", text: Binding($equipment.status, default: ""))
                TextField("Location", text: Binding($equipment.location, default: ""))
                
                // Picker binding remains unchanged as it's an enum (assuming EquipmentType is non-optional)
                Picker("Type", selection: $equipment.type) {
                    ForEach(EquipmentType.allCases, id: \.self) { eqType in
                        Text(eqType.rawValue).tag(eqType)
                    }
                }
            } header: {
                Text("Equipment Details")
            }
            
            Section("Actions") {
                Button(role: .destructive) {
                    context.delete(equipment)
                } label: {
                    Label("Delete Equipment", systemImage: "trash")
                }
            }
        }
        .navigationTitle("Details")
    }
}

// Extension for safely handling optional bindings
extension Binding {
    init(_ optional: Binding<Value?>, default defaultValue: Value) {
        self.init(
            get: { optional.wrappedValue ?? defaultValue },
            set: { newValue in optional.wrappedValue = newValue }
        )
    }
}
