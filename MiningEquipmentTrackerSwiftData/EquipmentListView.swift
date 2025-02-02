//
//  EquipmentListView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//

import SwiftUI
import SwiftData

struct EquipmentListView: View {
    // Category to filter equipment
    let category: String

    // Fetch equipment data
    @Query var equipment: [Equipment]
    
    // Control for showing the add sheet
    @State private var showingAddSheet = false

    // Filtered equipment by category
    var filteredEquipment: [Equipment] {
        equipment.filter { $0.type == category }
    }

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            NavigationStack {
                List {
                    ForEach(EquipmentType.allCases, id: \.self) { eqType in
                        Section(header: Text(eqType.rawValue).foregroundColor(.white)) {
                            ForEach(filteredEquipment.filter { $0.type == eqType.rawValue }) { equip in
                                NavigationLink(value: equip) {
                                    VStack(alignment: .leading) {
                                        Text("Equipment #: \(equip.equipmentNumber)")
                                            .foregroundColor(.white)
                                        if let status = equip.status {
                                            Text("Status: \(status)")
                                                .foregroundColor(.gray)
                                                .font(.subheadline)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Equipment")
                .navigationDestination(for: Equipment.self) { equip in
                    EquipmentDetailView(equipment: equip)
                }
                .toolbar {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(.plain)
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddEquipmentView()
                    .presentationDetents([.medium])
            }
        }
    }
}
