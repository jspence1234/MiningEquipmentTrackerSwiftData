//
//  PartSetDetailView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI
import SwiftData

struct PartSetDetailView: View {
    let partSet: PartSet  // No property wrapper needed

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            VStack(alignment: .leading, spacing: 20) {
                Text(partSet.setName)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                Divider().background(Color.white)

                Text("Parts in this set:")
                    .font(.headline)
                    .foregroundColor(.white)

                ForEach(partSet.parts) { part in
                    Text("• \(part.name) (\(part.partNumber))")
                        .foregroundColor(.white)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Set Details")
    }
}

struct AddPartSetView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var setName: String = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Set Name", text: $setName)
            }
            .navigationTitle("Add Part Set")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newSet = PartSet(setName: setName)
                        context.insert(newSet)
                        dismiss()
                    }
                }
            }
        }
    }
}
