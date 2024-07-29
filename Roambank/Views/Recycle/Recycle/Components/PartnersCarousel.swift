//
//  PartnersCarousel.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct PartnersCarousel: View {
    var partners: [Partner]
    
    var body: some View {
        TabView {
            ForEach(partners) { partner in
                ZStack {
                    Image(partner.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    VStack{
                        Spacer()
                        HStack{
                            Text(partner.title)
                                .font(.headline)
                                .padding(.top, 5)
                                .foregroundColor(.white)
//                                .background(Color.black.opacity(0.5))
                                .cornerRadius(5)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    }
                }
                .frame(width: 300, height: 200)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 220)
    }
}
