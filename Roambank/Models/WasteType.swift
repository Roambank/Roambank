//
//  WasteCategory.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct WasteType: Identifiable {
    let id: UUID
    let nama: String
    let gambar: String
    let poinPerKilo: Int
    let category: String
    let wasteItems: [WasteItem]
    var steps: [Step]
    
    init(id: UUID = UUID(), nama: String, gambar: String, poinPerKilo: Int, category: String, wasteItems: [WasteItem], steps: [Step]) {
        self.id = id
        self.nama = nama
        self.gambar = gambar
        self.poinPerKilo = poinPerKilo
        self.category = category
        self.wasteItems = wasteItems
        self.steps = steps
    }
}

