//
//  RecycleView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 24/07/24.
//

import SwiftUI

struct RecycleView: View {
    @State private var navigateFromRecycle = false
    @State private var navigateToProfile = false
    @State private var selectedFilter: PickupFilter = .all
    @State private var orders: [Order] = [
        Order(
            user: User(nama: "John Doe", noHP: "08123456789", alamat: "Jl. Example No. 123, Surabaya", email: "Joni@gmail.com"),
            wastes: [
                WasteOrder(wasteType: WasteType(nama: "Tas Plastik", gambar: "plastik.png", poinPerKilo: 8, category: "Plastik", wasteItems: [], steps: []), berat: 2.0),
                WasteOrder(wasteType: WasteType(nama: "Botol Plastik", gambar: "plastik.png", poinPerKilo: 10, category: "Plastik", wasteItems: [], steps: []), berat: 2.0),
                WasteOrder(wasteType: WasteType(nama: "Kardus", gambar: "kardus.png", poinPerKilo: 5, category: "Kertas", wasteItems: [], steps: []), berat: 5.0)
            ],
            intervalJam: "07:00 - 09:00",
            hari: "Mon, 24 Jul 2024",
            lokasi: "Some Address",
            detailLokasi: "Near the entrance",
            status: "Ongoing",
            rombeng: Rombeng(nama: "John Doe", wilayah: "Surabaya"),
            poin: 25,
            keteranganLokasi: "Some notes"
        ),
        Order(
            user: User(nama: "John Doe", noHP: "08123456789", alamat: "Jl. Example No. 123, Surabaya", email: "Joni@gmail.com"),
            wastes: [WasteOrder(wasteType: WasteType(nama: "Botol Plastik", gambar: "waterbottle", poinPerKilo: 10, category: "Plastik", wasteItems: [], steps: []), berat: 1.0)],
            intervalJam: "09:00 AM",
            hari: "March 13th, 2024",
            lokasi: "Kost Green House Citraland",
            detailLokasi: "",
            status: "Completed",
            rombeng: Rombeng(nama: "John Doe", wilayah: "Surabaya"),
            poin: 10,
            keteranganLokasi: ""
        ),
        Order(
            user: User(nama: "John Doe", noHP: "08123456789", alamat: "Jl. Example No. 123, Surabaya", email: "Joni@gmail.com"),
            wastes: [WasteOrder(wasteType: WasteType(nama: "Botol Plastik", gambar: "waterbottle", poinPerKilo: 10, category: "Plastik", wasteItems: [], steps: []), berat: 1.0)],
            intervalJam: "12:00 AM",
            hari: "March 13th, 2024",
            lokasi: "Kost Green House Citraland",
            detailLokasi: "",
            status: "Completed",
            rombeng: Rombeng(nama: "John Doe", wilayah: "Surabaya"),
            poin: 10,
            keteranganLokasi: ""
        )
    ]

    var filteredOrders: [Order] {
        switch selectedFilter {
        case .all:
            return orders
        case .ongoing:
            return orders.filter { $0.status == "On going" }
        case .completed:
            return orders.filter { $0.status == "Completed" }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    CustomHeaderView(navigateToProfile: $navigateToProfile)
                    
                    Picker("Filter", selection: $selectedFilter) {
                        ForEach(PickupFilter.allCases, id: \.self) { filter in
                            Text(filter.rawValue).tag(filter)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .padding(.top, 20)

                    ForEach(filteredOrders) { order in
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            OrderRow(order: order)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal)
                    
                    Button {
                        navigateFromRecycle = true
                    } label: {
                        Text("Request Pick-Up")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Ijo"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Section(header: SectionHeader(title: "Our Partners", linkTitle: "See All")) {
                        CarouselView(partners: [
                            Partner(imageName: "community1", title: "Bank Sampah Surabaya"),
                            Partner(imageName: "community1", title: "Klinko"),
                            Partner(imageName: "community1", title: "Universal Eco")
                        ])
                        .frame(height: 200)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Section(header: SectionHeader(title: "Komunitas", linkTitle: "Lihat Semua")) {
                                          VStack(spacing: 10) {
                                              CommunityCard(imageName: "community1", title: "Bank Sampah Surabaya Induk", description: "Bank Sampah Induk Surabaya telah aktif berkecimpung dalam bidang pengelolaan sampah selama lebih dari 10 tahun.")
                                              CommunityCard(imageName: "community1", title: "Klinko", description: "Klinko telah menerapkan proses ekonomi sirkular dengan menggunakan bahan baku limbah tekstil")
                                              CommunityCard(imageName: "community1", title: "Universal Eco", description: "Universal Eco adalah perusahaan pengelola limbah yang bertanggung jawab dan ramah lingkungan.")
                                          }
                                          .padding(.horizontal)
                                      }
                                      
                    Section(header: SectionHeader(title: "Berita", linkTitle: "Lihat Semua")) {
                        VStack(spacing: 10) {
                            NewsCard(imageName: "community1", title: "Dampak Positif dari Konten Pandawara Grup, Anak-anak di Wakatobi Ini Terjun ke Sungai dan Membersihkan Sampah yang Menumpuk", date: "23 Juli 2024")
                            NewsCard(imageName: "community1", title: "Manajemen Sumberdaya Alam dan Keberlanjutan Lingkungan: Tantangan dan Lingkungan", date: "18 Juli 2024")
                            NewsCard(imageName: "community1", title: "Dukung Keberlanjutan Lingkungan, Astra Motor Tanam 254 Pohon di SMA Negeri Bali Mandara", date: "15 Juli 2024")
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Recycle")
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateFromRecycle) {
                WasteCategoryView(navigateFromRecycle: $navigateFromRecycle)
            }
            .navigationDestination(isPresented: $navigateToProfile) {
                ProfileView()
            }
        }
    }
}

struct OrderRow: View {
    var order: Order

    var body: some View {
        HStack {
            Image(systemName: "truck.box.fill")
                .resizable()
                .frame(width: 30, height: 20)
                .foregroundColor(.white)
                .padding(15)
                .background(Circle().fill(Color("Ijo")).shadow(radius: 2))

            VStack(alignment: .leading) {
                Text("\(order.wastes.reduce(0) { $0 + $1.berat }, specifier: "%.1f") Kg")
                Text("\(order.wastes.reduce(0) { $0 + $1.berat }, specifier: "%.1f") Kg • \(order.lokasi)")
                    .font(.headline)

                Text(order.status)
                    .font(.subheadline)
                    .foregroundColor(order.status == "Completed" ? .green : .yellow)

                Text(order.hari)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct CustomHeaderView: View {
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

struct SectionHeader: View {
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

struct CommunityCard: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct NewsCard: View {
    var imageName: String
    var title: String
    var date: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

enum PickupFilter: String, CaseIterable {
    case all = "All"
    case ongoing = "Ongoing"
    case completed = "Completed"
}

struct Partner: Identifiable {
    let id = UUID()
    var imageName: String
    var title: String
}

struct CarouselView: View {
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

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleView()
    }
}

struct OrderDetailView: View {
    var order: Order

    var body: some View {
        Text("Order Details for \(order.id.uuidString)")
    }
}
