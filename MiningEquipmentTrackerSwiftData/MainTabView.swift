//
//  MainTabView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            EquipmentListView()
                .tabItem {
                    Image(systemName: "wrench.and.screwdriver")
                    Text("Equipment")
                }

            PartCatalogView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Parts")
                }

            QRScannerView()
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                }
        }
    }
}