//
//  BottomNavBarItem.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 29/07/24.
//

import SwiftUI

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
