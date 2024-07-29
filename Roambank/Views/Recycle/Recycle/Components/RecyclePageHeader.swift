//
//  RecycleCustomHeader.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct RecyclePageHeader: View {
    @Binding var navigateToProfile: Bool
    
    var body: some View {
        HStack {
            Text("Recycle")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
            
            Spacer()
            
            Button(action: {
                navigateToProfile = true
            }) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.primary)
                    .padding(5)
            }
            .background(Circle().fill(Color.white).shadow(radius: 2))
        }
        .padding()
    }
}
