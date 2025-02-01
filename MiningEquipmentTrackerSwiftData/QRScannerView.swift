//
//  QRScannerView.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @State private var isScanning = true
    @State private var scanResult: String = ""

    var body: some View {
        ZStack {
            SpaceGradientBackground()

            VStack {
                if isScanning {
                    CodeScannerView(codeTypes: [.qr],
                                    scanMode: .continuous,
                                    completion: handleScan)
                        .frame(height: 400)
                }

                Text("Scan Result:")
                    .foregroundColor(.white)
                Text(scanResult)
                    .foregroundColor(.white)
                    .bold()
                    .padding()

                Button(isScanning ? "Stop Scanning" : "Start Scanning") {
                    isScanning.toggle()
                }
                .buttonStyle(DarkTransparentButtonStyle())
            }
        }
    }

    /// Define the function that matches the library’s signature
    private func handleScan(_ result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let success):
            // success.string contains the scanned text
            scanResult = success.string
            // Optionally stop scanning
            isScanning = false

        case .failure(let error):
            scanResult = "Scan failed: \(error.localizedDescription)"
        }
    }
}
