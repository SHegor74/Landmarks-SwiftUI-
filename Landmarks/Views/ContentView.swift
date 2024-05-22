//
//  ContentView.swift
//  Landmarks
//
//  Created by Egor Naberezhnov on 04.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .list
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
