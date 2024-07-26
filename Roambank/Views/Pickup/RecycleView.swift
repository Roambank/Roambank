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

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button {
                        navigateFromRecycle = true
                    } label: {
                        Text("Ajukan Penjemputan")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Ijo"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                    Section(header: SectionHeader(title: "Komunitas", linkTitle: "Lihat Semua")) {
                        VStack(spacing: 10) {
                            CommunityCard(imageName: "community1", title: "Bank Sampah Surabaya Induk", description: "Bank Sampah Induk Surabaya telah aktif berkecimpung dalam bidang pengelolaan sampah selama lebih dari 10 tahun.")
                            CommunityCard(imageName: "community2", title: "Klinko", description: "Klinko telah menerapkan proses ekonomi sirkular dengan menggunakan bahan baku limbah tekstil")
                            CommunityCard(imageName: "community3", title: "Universal Eco", description: "Universal Eco adalah perusahaan pengelola limbah yang bertanggung jawab dan ramah lingkungan.")
                        }
                        .padding(.horizontal)
                    }

                    Section(header: SectionHeader(title: "Berita", linkTitle: "Lihat Semua")) {
                        VStack(spacing: 10) {
                            NewsCard(imageName: "news1", title: "Dampak Positif dari Konten Pandawara Grup, Anak-anak di Wakatobi Ini Terjun ke Sungai dan Membersihkan Sampah yang Menumpuk", date: "23 Juli 2024")
                            NewsCard(imageName: "news2", title: "Manajemen Sumberdaya Alam dan Keberlanjutan Lingkungan: Tantangan dan Lingkungan", date: "18 Juli 2024")
                            NewsCard(imageName: "news3", title: "Dukung Keberlanjutan Lingkungan, Astra Motor Tanam 254 Pohon di SMA Negeri Bali Mandara", date: "15 Juli 2024")
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
            }
            .navigationTitle("Recycle")
            .navigationDestination(isPresented: $navigateFromRecycle) {
                WasteCategoryView(navigateFromRecycle: $navigateFromRecycle)
            }
            .navigationDestination(isPresented: $navigateToProfile) {
                ProfileView()
            }
            .overlay(
                HStack {
                    Spacer()
                    Button(action: {
                        navigateToProfile = true
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 50, height: 50)
                                .shadow(radius: 2)
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.primary)
                            .padding()
                        }
                    }
                }
//                    .frame(height: 0)
//                .padding(.top, 0) // Adjust this value to move the button higher
                , alignment: .topTrailing
            )
        }
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

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleView()
    }
}
