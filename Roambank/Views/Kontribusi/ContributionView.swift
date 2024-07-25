//
//  ContributionView.swift
//  Roambank
//
//  Created by Lisandra Nicoline on 23/07/24.
//

import SwiftUI
import Observation

struct ContributionView: View {
    let wastes: [Waste]
    @State private var showingSheet = false
    @State private var selectedOption = "CO2"
    
    var totalCO2: Double {
        wastes.reduce(0) { $0 + calculateCO2(waste: $1) }
    }
    
    var totalTree: Double {
        wastes.reduce(0) { $0 + calculateTree(waste: $1) }
    }
    
    var body: some View {
        ZStack {
            Image("ContributionBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 550)
                    .cornerRadius(25)
                    .edgesIgnoringSafeArea(.bottom)
            }
            
            VStack {
                HStack {
                    Text("Kontribusi")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "bell")
                        .foregroundColor(.white)
                }
                .padding(.top,60)
                .padding(.leading,20)
                .padding(.trailing, 20)
                
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 100, height: 30)
                            .cornerRadius(25)
                            .edgesIgnoringSafeArea(.bottom)
                        HStack {
                            Image(selectedOption == "CO2" ? "iconjejakkarbon" : "iconpohonditanam")
                                .resizable()
                                .frame(width: 18, height: 18)
                            Text(selectedOption)
                                .font(Font.system(size: 15))
                                .foregroundColor(Color(.black))
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color(.black))
                        }
                        .onTapGesture {
                            showingSheet = true
                        }
                    }
                        
                    Text(selectedOption == "CO2" ? "\(totalCO2, specifier: "%.0f")kg" : "\(totalTree, specifier: "%.0f") pohon")
                        .font(.system(size: 54, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                        
                    Text("Total \(selectedOption == "CO2" ? "CO2 Dikurangi" : "Pohon Ditanam")")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Ringkasan daur ulang")
                            .font(.headline)
                            .padding(.bottom, 2)
                        
                        Text("Sejauh ini, anda telah mendaur ulang..")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom,8)
                        
                        ForEach(wastes) { waste in
                            HStack {
                                Circle()
                                    .fill(Color("E0F2F1"))
                                    .frame(width: 30, height: 30)
                                
                                VStack(alignment: .leading) {
                                    Text(waste.wasteType.nama)
                                        .font(.headline)
                                    Text("\(waste.berat)kg")
                                        .font(.subheadline)
                                }
                                Spacer()
                                Text(selectedOption == "CO2" ? "\(calculateCO2(waste: waste), specifier: "%.0f")kg CO2" : "\(calculateTree(waste: waste), specifier: "%.0f") pohon")
                                    .foregroundColor(.green)
                            }
                            .padding(.vertical, 5)
                            Divider()
                        }
                    }
                    .padding()
                    .padding(.horizontal)
                    .offset(y: -250)
                    .sheet(isPresented: $showingSheet) {
                        SheetView(showingSheet: $showingSheet, selectedOption: $selectedOption)
                            .presentationDetents([.height(230)])
                    }
                }
            }
        }
    }
    
    func calculateCO2(waste: Waste) -> Double {
        let multiplier: Double
        switch waste.wasteType.nama {
        case "Plastik":
            multiplier = 1.03
        case "Kertas", "Kaca", "Logam":
            multiplier = 1.00
        default:
            multiplier = 1.00 // Default multiplier jika jenis limbah tidak dikenali
        }
        return Double(waste.berat) * multiplier
    }
    
    func calculateTree(waste: Waste) -> Double {
            let treeMultiplier: Double
            switch waste.wasteType.nama {
            case "Plastik":
                treeMultiplier = 0.5
            case "Kertas":
                treeMultiplier = 0.3
            case "Kaca":
                treeMultiplier = 0.4
            case "Logam":
                treeMultiplier = 0.2
            default:
                treeMultiplier = 0.25 // Default multiplier jika jenis limbah tidak dikenali
            }
            return Double(waste.berat) * treeMultiplier
        }
}

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

struct BottomNavBarItem: View {
    var iconName: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
            Text(title)
                .font(.footnote)
        }
    }
}

//
//#Preview {
//    ContributionView()
//}
