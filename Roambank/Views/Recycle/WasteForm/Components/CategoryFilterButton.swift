//
//  CategoryFilterButton.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct CategoryFilterButton: View {
    var wasteCategory: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(wasteCategory)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .foregroundColor(isSelected ? .white : Color("Ijo"))
                .background(isSelected ? Color("Ijo") : Color("Ijo").opacity(0.1))
                .cornerRadius(50)
        }
    }
}
