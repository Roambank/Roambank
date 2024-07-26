//
//  Step.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 23/07/24.
//

import Foundation

struct Step: Identifiable {
    let id: UUID
    let image: String
    let description: String
    
    init(id: UUID = UUID(), image: String, description: String) {
        self.id = id
        self.image = image
        self.description = description
    }
}
