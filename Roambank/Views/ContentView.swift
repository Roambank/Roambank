//
//  HomeView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 24/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecycleView()
                .tabItem {
                    Image(systemName: "arrow.3.trianglepath")
                    Text("Recycle")
                }

            ContributionView()
                .tabItem {
                    Image(systemName: "leaf")
                    Text("Contributions")
                }

            GuideView()
                .tabItem {
                    Image(systemName: "lightbulb.max")
                    Text("Guide")
                }
        }
        .accentColor(Color("Ijo"))
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
        ContentView()
    }
}
