//
//  Part.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftData
import Foundation

@Model
class Part {
    var id = UUID()
    var name: String
    var equipmentID: PersistentIdentifier // Link to Equipment

    init(name: String, equipmentID: PersistentIdentifier) {
        self.name = name
        self.equipmentID = equipmentID
    }
}

@Model
class Equipment {
    var equipmentNumber: String  // e.g., "6004"
    var type: EquipmentType
    var model: String?
    var serialNumber: String?
    var status: String = "Active" // Default status
    var location: String = "Unknown" // Default location
    var parts: [Part] = [] // Relationship to Parts

    init(equipmentNumber: String,
         type: EquipmentType,
         model: String? = nil,
         serialNumber: String? = nil,
         status: String = "Active",
         location: String = "Unknown") {
        self.equipmentNumber = equipmentNumber
        self.type = type
        self.model = model
        self.serialNumber = serialNumber
        self.status = status
        self.location = location
    }
    
    // Validation for Equipment Number
    var isValidEquipmentNumber: Bool {
        equipmentNumber.allSatisfy(\.isNumber) && equipmentNumber.count == 4
    }

    // User-facing description
    var description: String {
        "\(type.rawValue) - \(equipmentNumber)"
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
    case unknown = "Unknown" // Add this case
}

@Model
class PartSet {
    var setName: String
    // Relationship: A set can hold multiple parts
    // We can store them in a [Part], but SwiftData uses references.
    // We'll do it with a to-many relationship:
    var parts: [Part]

    init(setName: String, parts: [Part] = []) {
        self.setName = setName
        self.parts = parts
    }
}

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}


