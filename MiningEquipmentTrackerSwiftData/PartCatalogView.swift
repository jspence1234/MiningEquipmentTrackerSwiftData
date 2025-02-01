//
//  PartCatalogView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI
import SwiftData

struct PartCatalogView: View {
    @Query(sort: \Part.name, order: .forward)
    private var allParts: [Part]

    @Query(sort: \PartSet.setName, order: .forward)
    private var allPartSets: [PartSet]
    
    @State private var showAddPartSheet = false
    @State private var showAddSetSheet = false

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            NavigationStack {
                List {
                    Section(header: Text("All Parts").foregroundColor(.white)) {
                        ForEach(allParts) { part in
                            NavigationLink(value: part) {
                                Text("\(part.name) (\(part.partNumber))")
                                    .foregroundColor(.white)
                            }
                        }
                    }

                    Section(header: Text("Part Sets").foregroundColor(.white)) {
                        ForEach(allPartSets) { partSet in
                            NavigationLink(value: partSet) {
                                Text("\(partSet.setName)")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Parts")
                .navigationDestination(for: Part.self) { part in
                    PartDetailView(part: part)
                }
                .navigationDestination(for: PartSet.self) { set in
                    PartSetDetailView(partSet: set)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Menu {
                            Button("Add Part") {
                                showAddPartSheet = true
                            }
                            Button("Add Part Set") {
                                showAddSetSheet = true
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddPartSheet) {
                AddPartView()
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $showAddSetSheet) {
                AddPartSetView()
                    .presentationDetents([.medium])
            }
        }
    }
}
