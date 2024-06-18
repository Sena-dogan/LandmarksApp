//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 28.05.2024.
//

import SwiftUI

struct LandmarkList: View {
    @ObservedObject var viewModel: LandmarkListViewModel

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $viewModel.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(viewModel.filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(viewModel: LandmarkDetailViewModel(modelData: viewModel.modelData, landmark: landmark))
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: viewModel.filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(viewModel: LandmarkListViewModel(modelData: ModelData()))
    }
}
