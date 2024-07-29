//
//  User.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    let nama: String
    let noHP: String
    let alamat: String
    let email: String
    
    init(id: UUID = UUID(), nama: String, noHP: String, alamat: String, email: String) {
        self.id = id
        self.nama = nama
        self.noHP = noHP
        self.alamat = alamat
        self.email = email
    }
}

