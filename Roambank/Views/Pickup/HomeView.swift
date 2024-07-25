//
//  HomeView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 24/07/24.
//

import SwiftUI

struct HomeView: View {    
    var body: some View {
        TabView {
            RecycleView()
                .tabItem {
                    Image(systemName: "arrow.2.circlepath.circle")
                    Text("Recycle")
                }

            ContributionView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Contributions")
                }

            GuideView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Guide")
                }
        }
    }
}

struct ContributionView: View {
    var body: some View {
        VStack {
            Text("Contribution Content")
            // Add your Contribution page content here
        }
        .navigationTitle("Kontribusi")
    }
}

struct GuideView: View {
    var body: some View {
        VStack {
            Text("Guide Content")
            // Add your Guide page content here
        }
        .navigationTitle("Panduan")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
