//
//  PartSet.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//


import SwiftData
import Foundation

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