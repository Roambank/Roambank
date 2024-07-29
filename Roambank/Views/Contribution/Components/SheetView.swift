//
//  SheetView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var showingSheet: Bool
    @Binding var selectedOption: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Pilih Kategori")
                .font(.headline)
                .padding(.horizontal)

            Text("Pilih kategori untuk blablabla")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding([.bottom, .horizontal])
            
            VStack(spacing: 0) {
                Button(action: {
                    selectedOption = "CO2"
                    showingSheet = false
                }) {
                    HStack {
                        Image("iconjejakkarbon")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 24, height: 24)
                            .background(Circle().fill(Color.green.opacity(0.1)).frame(width: 40, height: 40))
                            .padding(.trailing,13)
                        Text("Jejak Karbon")
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                Divider()
                Button(action: {
                    selectedOption = "Tree"
                    showingSheet = false
                }) {
                    HStack {
                        Image("iconpohonditanam")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 24, height: 24)
                            .background(Circle().fill(Color.green.opacity(0.1)).frame(width: 40, height: 40))
                            .padding(.trailing,13)
                        Text("Pohon Ditanam")
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            .background(Color.white)
        }
        .padding()
        .cornerRadius(25)
    }
}
