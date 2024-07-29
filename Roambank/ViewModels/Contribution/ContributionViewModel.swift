//
//  ContributionViewModel.swift
//  Roambank
//
//  Created by Lisandra Nicoline on 24/07/24.
//

import Foundation
import Combine
import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var orders: [Order]
    
    init(orders: [Order] = []) {
        self.orders = orders
    }
    
    func addOrder(order: Order) {
        orders.append(order)
    }
}

class WasteViewModel: ObservableObject, Identifiable {
    @Published var waste: WasteOrder
    
    init(waste: WasteOrder) {
        self.waste = waste
    }
    
    var id: UUID {
        return waste.id
    }
    
    var wasteType: WasteType {
        return waste.wasteType
    }
    
    var berat: Double {
        get {
            return waste.berat
        }
        set {
            waste.berat = newValue
        }
    }
}

struct ContributionView_Previews: PreviewProvider {
    static var previews: some View {
        let wasteType = WasteType(nama: "Organic", gambar: "organic.png", poinPerKilo: 10, category: "Organic", wasteItems: [], steps: [])
        let wastes = [
            WasteOrder(wasteType: wasteType, berat: 5),
            WasteOrder(wasteType: wasteType, berat: 2)
        ]
        
        return ContributionView()
    }
}
