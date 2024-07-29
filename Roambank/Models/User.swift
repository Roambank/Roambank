//
//  User.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let nama: String
    let noHP: String
    let alamat: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id = "UserID"
        case nama = "UserName"
        case noHP = "UserPhoneNumber"
        case alamat = "UserAddress"
        case email = "UserEmail"
    }
    
    init() {
        self.id = UUID()
        self.nama = ""
        self.noHP = ""
        self.alamat = ""
        self.email = ""
    }
    
    init(id: UUID = UUID(), nama: String, noHP: String, alamat: String, email: String) {
        self.id = id
        self.nama = nama
        self.noHP = noHP
        self.alamat = alamat
        self.email = email
    }
    
    init(nama: String, noHP: String, alamat: String, email: String) {
        self.id = UUID()
        self.nama = nama
        self.noHP = noHP
        self.alamat = alamat
        self.email = email
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        nama = try values.decode(String.self, forKey: .nama)
        noHP = try values.decode(String.self, forKey: .noHP)
        alamat = try values.decode(String.self, forKey: .alamat)
        email = try values.decode(String.self, forKey: .email)
    }
   
   func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(id, forKey: .id)
       try container.encode(nama, forKey: .nama)
       try container.encode(noHP, forKey: .noHP)
       try container.encode(alamat, forKey: .alamat)
       try container.encode(email, forKey: .email)
   }
}

struct AddUserResponseData: Codable {
    var code: Int
    var desc: String
}

struct AddUserRequestData: Codable {
    var feature: String
    var userData: User
    
    init(feature: String, userData: User) {
        self.feature = feature
        self.userData = userData
    }
    
    enum CodingKeys: String, CodingKey {
        case feature
        case userData = "User"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feature = try container.decode(String.self, forKey: .feature)
        self.userData = try container.decode(User.self, forKey: .userData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.feature, forKey: .feature)
        try container.encode(self.userData, forKey: .userData)
    }
}

struct GetUsersResponseData: Codable {
    var code: Int
    var desc: String
    var userData: User
    
    init(code: Int, desc: String, userData: User) {
        self.code = code
        self.desc = desc
        self.userData = userData
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case desc
        case userData = "User"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.userData = try container.decode(User.self, forKey: .userData)
    }
}

struct GetUsersRequestData: Codable {
    var feature: String
    var userId: Int
    
    init(feature: String, userId: Int) {
        self.feature = feature
        self.userId = userId
    }
    
    enum CodingKeys: String, CodingKey {
        case feature
        case userId = "UserID"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feature = try container.decode(String.self, forKey: .feature)
        self.userId = try container.decode(Int.self, forKey: .userId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.feature, forKey: .feature)
        try container.encode(self.userId, forKey: .userId)
    }
}

