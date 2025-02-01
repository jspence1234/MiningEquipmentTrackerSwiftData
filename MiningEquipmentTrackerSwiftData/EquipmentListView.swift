//
//  EquipmentListView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI
import SwiftData

struct EquipmentListView: View {
    // SwiftData: automatically fetch all Equipment
    @Query(sort: \Equipment.equipmentNumber, order: .forward)
    private var equipmentList: [Equipment]

    // We’ll need the ModelContext to create new items
    @Environment(\.modelContext) private var context

    @State private var showingAddSheet = false

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            NavigationStack {
                List {
                    ForEach(EquipmentType.allCases, id: \.self) { eqType in
                        Section(header: Text(eqType.rawValue).foregroundColor(.white)) {
                            ForEach(equipmentList.filter { $0.type == eqType }) { equip in
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
