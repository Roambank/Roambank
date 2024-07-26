//
//  WasteDetail.swift
//  Recykloo
//
//  Created by Eldenabih Tavirazin Lutvie on 21/07/24.
//

import SwiftUI

struct WasteDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var digitData: Double
    var wasteType: WasteType
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Jenis-jenis sampah yang kami terima")
                        .font(.system(size: 16, weight: .medium))
                    Text("Pastikan sampahmu sesuai dengan jenis di bawah yaa!")
                        .font(.system(size: 14, weight: .regular))
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(wasteType.wasteItems) { wasteItem in
                                VStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.secondarySystemBackground))
                                        .frame(width: 120, height: 120)
                                        .overlay(
                                            Image(wasteItem.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                        )
                                    Text(wasteItem.name)
                                        .font(.system(size: 18, weight: .regular))
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .background(Color(.tertiarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                    .padding(.bottom, 23)
                    
                    Text("Siapkan sampahmu")
                        .font(.system(size: 16, weight: .medium))
                    Text("Bantu kami dengan mengemas produk dengan bersih")
                        .font(.system(size: 14, weight: .regular))
                    
                    ScrollView(.vertical) {
                        ForEach(wasteType.steps) { step in
                            VStack(alignment: .leading) {
                                Image(step.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300, height: 200)
                                Text(step.description)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding(.bottom, 16)
                        }
                    }
                    
                    HStack {
                        Text("Estimasi berat")
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        CustomStepper(digitData: $digitData)
                    }
                    .padding(.bottom, 16)
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Add item")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.horizontal, 145)
                            .padding(.vertical, 15)
                            .foregroundColor(.white)
                            .background(Color("Ijo"))
                            .cornerRadius(8)
                    }
                }
                .padding(16)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Text(wasteType.nama)
                            .font(.headline)
                        Spacer()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "xmark")
                        }
                        .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

