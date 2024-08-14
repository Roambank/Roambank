//
//  Order.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 17/07/24.
//

import Foundation

struct Order: Codable, Identifiable {
    let id: UUID
    let user: User
    let wastes: [WasteOrder]
    let intervalJam: String
    let hari: String
    let lokasi: String
    let detailLokasi: String
    let keteranganLokasi: String
    let status: String
    let rombeng: Rombeng
    let poin: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "OrderID"
        case user = "User"
        case wastes = "wasteOrders"
        case intervalJam = "TimeInterval"
        case hari = "Day"
        case lokasi = "Location"
        case detailLokasi
        case keteranganLokasi
        case status = "Status"
        case rombeng
        case poin = "Points"
    }
    
    init(id: UUID = UUID(), user: User, wastes: [WasteOrder], intervalJam: String, hari: String, lokasi: String, detailLokasi: String, keteranganLokasi: String, status: String, rombeng: Rombeng, poin: Int) {
        self.id = id
        self.user = user
        self.wastes = wastes
        self.intervalJam = intervalJam
        self.hari = hari
        self.lokasi = lokasi
        self.detailLokasi = detailLokasi
        self.keteranganLokasi = keteranganLokasi
        self.status = status
        self.rombeng = rombeng
        self.poin = poin
    }
}

struct AddOrderRequestData: Codable {
    var feature: String
    var orderData: Order
    
    init(feature: String, orderData: Order) {
        self.feature = feature
        self.orderData = orderData
    }
    
    enum CodingKeys: String, CodingKey {
        case feature
        case orderData = "order"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feature = try container.decode(String.self, forKey: .feature)
        self.orderData = try container.decode(Order.self, forKey: .orderData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.feature, forKey: .feature)
        try container.encode(self.orderData, forKey: .orderData)
    }
}

struct AddOrderResponseData: Codable {
    var code: Int
    var desc: String
}

struct GetOrdersRequestData: Codable {
    var feature: String
    var orderId: UUID
    
    init(feature: String, orderId: UUID) {
        self.feature = feature
        self.orderId = orderId
    }
    
    enum CodingKeys: String, CodingKey {
        case feature
        case orderId = "orderid"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feature = try container.decode(String.self, forKey: .feature)
        self.orderId = try container.decode(UUID.self, forKey: .orderId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.feature, forKey: .feature)
        try container.encode(self.orderId, forKey: .orderId)
    }
}

struct GetOrdersResponseData: Codable {
    var code: Int
    var desc: String
    var orderData: Order
    
    init(code: Int, desc: String, orderData: Order) {
        self.code = code
        self.desc = desc
        self.orderData = orderData
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case desc
        case orderData = "orderdata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.orderData = try container.decode(Order.self, forKey: .orderData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.desc, forKey: .desc)
        try container.encode(self.orderData, forKey: .orderData)
    }
}
