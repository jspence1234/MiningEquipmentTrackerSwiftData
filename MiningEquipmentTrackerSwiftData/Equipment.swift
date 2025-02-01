//
//  Equipment.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftData
import Foundation

@Model
class Equipment {
    // SwiftData requires an initializer for reference types
    // We'll store the fields we need:
    
    // Unique ID is automatically handled by SwiftData
    // but you can explicitly do `var id: UUID = UUID()` if needed.

    var equipmentNumber: String  // e.g., "6004"
    var type: EquipmentType
    var model: String?
    var serialNumber: String?
    var status: String?
    var location: String?

    // Basic initializer
    init(equipmentNumber: String,
         type: EquipmentType,
         model: String? = nil,
         serialNumber: String? = nil,
         status: String? = nil,
         location: String? = nil) {
        self.equipmentNumber = equipmentNumber
        self.type = type
        self.model = model
        self.serialNumber = serialNumber
        self.status = status
        self.location = location
    }
}

/// For equipment categories
enum EquipmentType: String, CaseIterable, Codable {
    case shuttleCar = "Shuttle Car"
    case miner = "Miner"
    case ramCar = "Ram Car"
    case batteryScoop = "Battery Scoop"
    case dieselScoop = "Diesel Scoop"
    case batteryGolfCart = "Battery Golf Cart"
    case dieselGolfCart = "Diesel Golf Cart"
    case feeder = "Feeder"
    case mantrip = "Mantrip"
}