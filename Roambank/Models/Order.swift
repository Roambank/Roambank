//
//  Order.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct Order: Identifiable {
    let id: UUID
    let wastes: [Waste]
    let intervalJam: String
    let hari: String
    let lokasi: String
    let detailLokasi: String
    let keteranganLokasi: String
    let status: String
    let rombeng: Rombeng
    let poin: Int
    
    init(id: UUID = UUID(), user: User, wastes: [Waste], intervalJam: String, hari: String, lokasi: String, detailLokasi: String, status: String, rombeng: Rombeng, poin: Int, keteranganLokasi: String) {
        self.id = id
        self.wastes = wastes
        self.intervalJam = intervalJam
        self.detailLokasi = detailLokasi
        self.hari = hari
        self.lokasi = lokasi
        self.status = status
        self.rombeng = rombeng
        self.poin = poin
        self.keteranganLokasi = keteranganLokasi
    }
}
