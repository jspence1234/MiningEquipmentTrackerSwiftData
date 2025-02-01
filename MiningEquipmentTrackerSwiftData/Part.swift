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
    var name: String
    var partNumber: String
    var manufacturer: String?
    var category: String?
    var details: String?  // e.g. description

    init(name: String,
         partNumber: String,
         manufacturer: String? = nil,
         category: String? = nil,
         details: String? = nil) {
        self.name = name
        self.partNumber = partNumber
        self.manufacturer = manufacturer
        self.category = category
        self.details = details
    }
}