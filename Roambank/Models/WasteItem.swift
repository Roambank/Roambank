//
//  WasteItem.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 23/07/24.
//

import Foundation

struct WasteItem: Identifiable {
    let id: UUID
    let name: String
    let image: String
    
    init(id: UUID = UUID(), name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
