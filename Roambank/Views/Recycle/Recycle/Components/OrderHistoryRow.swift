//
//  OrderHistoryRow.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

struct OrderHistoryRow: View {
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
