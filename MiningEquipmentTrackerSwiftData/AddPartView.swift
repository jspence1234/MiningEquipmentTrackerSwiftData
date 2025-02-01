//
//  AddPartView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI
import SwiftData

struct AddPartView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var name: String = ""
    @State private var partNumber: String = ""
    @State private var manufacturer: String = ""
    @State private var category: String = ""
    @State private var details: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Part Info") {
                    TextField("Name", text: $name)
                    TextField("Part Number", text: $partNumber)
                    TextField("Manufacturer", text: $manufacturer)
                    TextField("Category", text: $category)
                    TextField("Details", text: $details)
                }
            }
            .navigationTitle("Add Part")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newPart = Part(name: name,
                                           partNumber: partNumber,
                                           manufacturer: manufacturer,
                                           category: category,
                                           details: details)
                        context.insert(newPart)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct PartDetailView: View {

    @Bindable var part: Part

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            VStack(alignment: .leading, spacing: 20) {
                Text(part.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                Text("Part Number: \(part.partNumber)")
                    .foregroundColor(.white)

                if let manufacturer = part.manufacturer, !manufacturer.isEmpty {
                    Text("Manufacturer: \(manufacturer)")
                        .foregroundColor(.white)
                }

                if let category = part.category, !category.isEmpty {
                    Text("Category: \(category)")
                        .foregroundColor(.white)
                }

                if let details = part.details, !details.isEmpty {
                    Text("Details: \(details)")
                        .foregroundColor(.white)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Part Details")
    }
}
