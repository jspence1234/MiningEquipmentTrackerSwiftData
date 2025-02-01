//
//  AddEquipmentView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI
import SwiftData

struct AddEquipmentView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    @State private var equipmentNumber: String = ""
    @State private var selectedType: EquipmentType = .shuttleCar
    @State private var model: String = ""
    @State private var status: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Equipment Info") {
                    TextField("Equipment Number", text: $equipmentNumber)
                    Picker("Type", selection: $selectedType) {
                        ForEach(EquipmentType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    TextField("Model", text: $model)
                    TextField("Status", text: $status)
                }
            }
            .navigationTitle("Add Equipment")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newEquipment = Equipment(equipmentNumber: equipmentNumber,
                                                    type: selectedType,
                                                    model: model,
                                                    status: status)
                        context.insert(newEquipment)
                        // SwiftData automatically saves changes
                        // in reality you might do `try? context.save()`
                        dismiss()
                    }
                }
            }
        }
    }
}