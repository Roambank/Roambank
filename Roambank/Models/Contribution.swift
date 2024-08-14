//
//  Contribution.swift
//  Roambank
//
//  Created by Lisandra Nicoline on 25/07/24.
//


import Foundation

struct Contribution: Codable, Identifiable {
    let id: UUID
    let user: User
    let wasteType: WasteType
    var berat: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case user = "User"
        case wasteType = "Waste"
        case berat = "Weight"
    }
    
    init(user: User, wasteType: WasteType, wasteOrder: WasteOrder) {
        self.id = UUID()
        self.user = user
        self.wasteType = wasteType
        self.berat = wasteOrder.berat
    }
}


