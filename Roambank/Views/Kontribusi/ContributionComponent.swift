//
//  ContributionComponent.swift
//  Roambank
//
//  Created by Lisandra Nicoline on 24/07/24.
//

import SwiftUI

struct ContributionComponent: View {
    let icon: String
    let items: [String]
    @State private var selectedIndex: Int = 0
    let font: CGFloat
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    init(icon: String, items: [String], font: CGFloat, width: CGFloat, height: CGFloat, cornerRadius: CGFloat) {
        self.icon = icon
        self.items = items
        self.font = font
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        VStack {
            Menu {
                ForEach(0..<items.count, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                    }) {
                        Text(items[index])
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Spacer()
                    Image(systemName: icon)
                        .font(.system(size: CGFloat(font), weight: .medium))
                        .foregroundColor(Color(.green))
                    Text("CO2")
                        .font(Font.system(size: font))
                        .foregroundColor(Color(.black))
                    Image(systemName: "chevron.down")
                        .font(.system(size: CGFloat(font), weight: .light))
                        .foregroundColor(Color(.black))

                    Spacer()
                }
            }
            .frame(width: width, height: height)
            .accentColor(Color(.black))
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
        .frame(alignment: .center)
    }
}

#Preview {
    ContributionComponent(icon: "carbon.dioxide.cloud", items: ["String"], font: 15, width: 150, height: 40, cornerRadius: 20)
}
