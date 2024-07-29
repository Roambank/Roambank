//
//  RecycleSectionHeader.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct RecycleSectionHeader: View {
    var title: String
    var linkTitle: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .padding(.leading)
            Spacer()
            Button(action: {
                // Action for Lihat Semua button
            }) {
                Text(linkTitle)
                    .font(.subheadline)
                    .foregroundColor(Color("Ijo"))
            }
            .padding(.trailing)
        }
        .padding(.top, 10)
    }
}
