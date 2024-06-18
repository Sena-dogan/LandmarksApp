//
//  ContentView.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 18.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelData()

    var body: some View {
        let listViewModel = LandmarkListViewModel(modelData: modelData)
        LandmarkList(viewModel: listViewModel)
            .environmentObject(modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
