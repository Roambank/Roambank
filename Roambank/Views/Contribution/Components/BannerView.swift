//
//  BannerView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack {
            Text("Register")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .onTapGesture {
                    // Registration logic here
                }
        }
    }
}
