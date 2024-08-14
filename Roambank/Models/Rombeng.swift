//
//  Rombeng.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct Rombeng: Codable, Identifiable {
    let id: UUID
    let nama: String
    let wilayah: String
    
    init() {
        self.id = UUID()
        self.nama = ""
        self.wilayah = ""
    }
    
    init(id: UUID = UUID(), nama: String, wilayah: String) {
        self.id = id
        self.nama = nama
        self.wilayah = wilayah
    }
}

