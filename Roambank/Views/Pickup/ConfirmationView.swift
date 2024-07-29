//
//  ConfirmationView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 23/07/24.
//

import SwiftUI

struct ConfirmationView: View {
    let order: Order
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @Binding var navigateFromRecycle: Bool

    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .padding(.top, 50)
                
                Text("Terima kasih telah berkontribusi untuk lingkungan!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Kami akan mengatur penjemputan dan driver kami akan segera menginformasikannya lebih lanjut.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.gray)
                
                Text("Order ID: \(order.id.uuidString.prefix(8).uppercased())")
                    .font(.caption2)
                    .padding(.top, 5)
                    .foregroundColor(.gray)
                
                
                Text("Rincian Sampah")
                    .font(.headline)
                    .padding(.top, 30)
                VStack {
                    ForEach(order.wastes) { waste in
                        HStack {
                            Text(waste.wasteType.nama)
                                .font(.body)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("\(waste.berat, specifier: "%.1f") KG")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                Text("Jadwal Penjemputan")
                    .font(.headline)
                    .padding(.top, 20)
                VStack {
                    HStack {
                        Text("Pickup Date")
                            .foregroundColor(.gray)
                        Spacer()
                        Text(order.hari)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        Text("Pickup Time")
                            .foregroundColor(.gray)
                        Spacer()
                        Text(order.intervalJam)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        Text("Pickup Address")
                            .foregroundColor(.gray)
                        Spacer()
                        Text(order.lokasi)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                Spacer()
                
                Button(action: {
                    navigateFromRecycle = false
                }) {
                    Text("Selesai")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleWaste = [
            WasteOrder(wasteType: WasteType(nama: "Tas Plastik", gambar: "plastik.png", poinPerKilo: 8, category: "Plastik", wasteItems: [], steps: []), berat: 2.0),
            WasteOrder(wasteType: WasteType(nama: "Botol Plastik", gambar: "plastik.png", poinPerKilo: 10, category: "Plastik", wasteItems: [], steps: []), berat: 2.0),
            WasteOrder(wasteType: WasteType(nama: "Kardus", gambar: "kardus.png", poinPerKilo: 5, category: "Kertas", wasteItems: [], steps: []), berat: 5.0)
        ]
        
        let sampleUser = User(nama: "John Doe", noHP: "08123456789", alamat: "Jl. Example No. 123, Surabaya", email: "Joni@gmail.com")
        
        let sampleOrder = Order(
            user: sampleUser,
            wastes: sampleWaste,
            intervalJam: "07:00 - 09:00",
            hari: "Mon, 24 Jul 2024",
            lokasi: "Some Address",
            detailLokasi: "Near the entrance",
            keteranganLokasi: "Some notes", status: "Pending",
            rombeng: Rombeng(nama: "John Doe", wilayah: "Surabaya"),
            poin: 25
        )
        
        return ConfirmationView(order: sampleOrder, navigateFromRecycle: .constant(false))
    }
}
