//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 18.05.2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
