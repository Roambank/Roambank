//
//  WasteCategory.swift
//  Recykloo
//
//  Created by palpedpad on 17/07/24.
//

import SwiftUI

struct WasteCategoryView: View {
    @State private var searchText: String = ""
    @State private var navigateToPickupFormView = false
    @State private var selectedWastes: [Waste] = []
    @Binding var navigateFromRecycle: Bool
    
    let wasteTypes = [
        WasteType(nama: "Botol Plastik", gambar: "waterbottle", poinPerKilo: 10, category: "Plastik", wasteItems: [
            WasteItem(name: "Botol Aqua", image: "aqua"),
            WasteItem(name: "Botol Pocari Sweat", image: "pocari sweat"),
            WasteItem(name: "Botol Teh Kotak", image: "teh kotak")
        ], steps: [
            Step(image: "prep", description: "Clean the bottle thoroughly."),
            Step(image: "prep", description: "Remove the cap and label."),
            Step(image: "prep", description: "Crush the bottle to save space.")
        ]),
        WasteType(nama: "Tas Plastik", gambar: "plastik", poinPerKilo: 8, category: "Plastik", wasteItems: [
            WasteItem(name: "Tas Belanja", image: "tas belanja"),
            WasteItem(name: "Tas Kresek", image: "tas kresek"),
            WasteItem(name: "Tas Plastik", image: "tas plastik")
        ], steps: [
            Step(image: "prep", description: "Clean the bottle thoroughly."),
            Step(image: "prep", description: "Remove the cap and label."),
            Step(image: "prep", description: "Crush the bottle to save space.")
        ]),
        WasteType(nama: "Kardus", gambar: "kardus", poinPerKilo: 5, category: "Kertas", wasteItems: [
            WasteItem(name: "Kardus Bekas", image: "kardus bekas"),
            WasteItem(name: "Kardus Pizza", image: "kardus pizza"),
            WasteItem(name: "Kardus Susu", image: "kardus susu")
        ], steps: [
            Step(image: "prep", description: "Clean the bottle thoroughly."),
            Step(image: "prep", description: "Remove the cap and label."),
            Step(image: "prep", description: "Crush the bottle to save space.")
        ]),
        WasteType(nama: "Kaleng", gambar: "kaleng soda", poinPerKilo: 12, category: "Logam", wasteItems: [
            WasteItem(name: "Kaleng Soda", image: "kaleng soda"),
            WasteItem(name: "Kaleng Susu", image: "kaleng susu"),
            WasteItem(name: "Kaleng Teh", image: "kaleng teh")
        ], steps: [
            Step(image: "prep", description: "Clean the bottle thoroughly."),
            Step(image: "prep", description: "Remove the cap and label."),
            Step(image: "prep", description: "Crush the bottle to save space.")
        ]),
    ]
    
    var body: some View {
            VStack {
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        CategoryButton(wasteCategory: "All")
                        CategoryButton(wasteCategory: "Plastik")
                        CategoryButton(wasteCategory: "Kertas")
                        CategoryButton(wasteCategory: "Logam")
                        CategoryButton(wasteCategory: "Kaleng")
                        CategoryButton(wasteCategory: "Kain")
                    }
                }
                .padding(.horizontal, 16)
                
                ZStack(alignment: .bottom) {
                    ScrollView(.vertical) {
                        VStack(spacing: 0) {
                            ForEach(wasteTypes, id: \.nama) { wasteType in
                                WasteCard(selectedWastes: $selectedWastes, wasteType: wasteType)
                            }
                        }
                        Spacer()
                    }
                    .padding(.bottom, 1)
                    Rectangle()
                        .fill(Color(.systemBackground))
                        .frame(height: 70)
                        .overlay {
                            HStack {
                                Button(action: {
                                    // Code
                                }) {
                                    HStack {
                                        Image(systemName: "list.dash")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 15, height: 15)
                                        Text("Added items")
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    .buttonStyle(.bordered)
                                    .controlSize(.regular)
                                    .padding(.horizontal, 26)
                                    .padding(.vertical, 12)
                                    .foregroundColor(.primary)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 8,
                                            style: .continuous)
                                        .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                                    )
                                }
                                    Button(action: {
                                        navigateToPickupFormView = true
                                    }) {
                                        Text("Continue")
                                            .font(.system(size: 16, weight: .semibold))
                                            .padding(.horizontal, 51)
                                            .padding(.vertical, 12)
                                            .foregroundColor(.white)
                                            .background(Color("Ijo"))
                                            .cornerRadius(8)
                                    }
                            }
                        }
                }
            }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .navigationTitle("Ajukan Penjemputan")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToPickupFormView) {
            PickupFormView(navigateFromRecycle: $navigateFromRecycle, selectedWastes: selectedWastes)
        }
    }
}

struct CategoryButton: View {
    var wasteCategory: String = ""
    
    var body: some View {
        Button(action: {
            // Code
        }) {
            Text(wasteCategory)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .foregroundColor(Color("Ijo"))
                .background(Color("Ijo").opacity(0.1))
                .cornerRadius(50)
        }
    }
}

struct WasteCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        WasteCategoryView(navigateFromRecycle: .constant(false))
    }
}
