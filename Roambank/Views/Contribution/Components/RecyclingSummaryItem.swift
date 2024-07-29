//
//  RecyclingSummaryItem.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct RecyclingSummaryItem: View {
    var title: String
    var weight: String
    var co2: String

    var body: some View {
        HStack {
            Circle()
                .fill(Color.green.opacity(0.3))
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(title)
                Text(weight)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(co2)
        }
        .padding(.vertical, 8)
    }
}
