//
//  Contribution.swift
//  Roambank
//
//  Created by Lisandra Nicoline on 25/07/24.
//


import Foundation

struct Contribution: Identifiable {
    let id: UUID
    let userId: User.ID
    let wasteType: WasteType
    var berat: Double
    
    init(userId: User.ID, wasteOrder: WasteOrder) {
        self.id = UUID()
        self.userId = userId
        self.wasteType = wasteOrder.wasteType
        self.berat = wasteOrder.berat
    }
}
