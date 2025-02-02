//
//  CreateEquipmentView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 2/1/25.
//

import SwiftUI
import SwiftData

struct CreateEquipmentView: View {
    @State private var name = ""
    @State private var type = EquipmentType.shuttleCar
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            TextField("Equipment Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Picker("Equipment Type", selection: $type) {
                ForEach(EquipmentType.allCases, id: \.self) { eqType in
                    Text(eqType.rawValue).tag(eqType)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            Button("Create Equipment") {
                let newEquipment = Equipment(
                    equipmentNumber: UUID().uuidString.prefix(8).uppercased(),
                    type: type
                )
                context.insert(newEquipment)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("New Equipment")
    }
}
