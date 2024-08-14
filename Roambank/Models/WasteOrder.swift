//
//  Waste.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct WasteOrder: Codable, Identifiable {
    let id: UUID
    let wasteType: WasteType
    var berat: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "WasteOrderID"
        case wasteType = "WasteType"
        case berat = "Weight"
    }
    
    init(id: UUID = UUID(), wasteType: WasteType, berat: Double) {
        self.id = id
        self.wasteType = wasteType
        self.berat = berat
    }
}
