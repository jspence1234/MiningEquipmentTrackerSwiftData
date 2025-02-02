import SwiftUI
import SwiftData

struct EquipmentDetailView: View {
    @Bindable var equipment: Equipment
    @Query var parts: [Part]
    @Environment(\.modelContext) private var context

    var filteredParts: [Part] {
        parts.filter { $0.equipmentID == equipment.id }
    }

    var body: some View {
        Form {
            // Equipment details section
            Section(header: Text("Equipment Details")) {
                TextField("Equipment #", text: $equipment.equipmentNumber)

                // Directly bind to non-optional fields
                TextField("Model", text: Binding(
                    get: { equipment.model ?? <#default value#> },
                    set: { equipment.model = $0 }
                ))

                TextField("Serial Number", text: Binding(
                    get: { equipment.serialNumber ?? <#default value#> },
                    set: { equipment.serialNumber = $0 }
                ))

                TextField("Status", text: Binding(
                    get: { equipment.status },
                    set: { equipment.status = $0 }
                ))

                TextField("Location", text: Binding(
                    get: { equipment.location },
                    set: { equipment.location = $0 }
                ))

                // Picker for equipment type
                Picker("Type", selection: $equipment.type) {
                    ForEach(EquipmentType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
            }

            // Parts section
            Section(header: Text("Parts for \(equipment.equipmentNumber)")) {
                if filteredParts.isEmpty {
                    Text("No parts found").foregroundColor(.gray)
                } else {
                    List(filteredParts) { part in
                        Text(part.name).font(.body)
                    }
                }
            }

            // Action section
            Section {
                Button(role: .destructive) {
                    context.delete(equipment)
                } label: {
                    Label("Delete Equipment", systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("\(equipment.equipmentNumber) Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    try? context.save()
                }
            }
        }
    }
}
