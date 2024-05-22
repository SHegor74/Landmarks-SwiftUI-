//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Egor Naberezhnov on 04.05.2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
