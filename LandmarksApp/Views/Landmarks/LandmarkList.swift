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
                        LandmarkDetail(viewModel: LandmarkDetailViewModel(landmark: landmark, listViewModel: viewModel), isFavorite: Binding(
                            get: { landmark.isFavorite },
                            set: { newValue in
                                if let index = viewModel.modelData.landmarks.firstIndex(where: { $0.id == landmark.id }) {
                                    viewModel.modelData.landmarks[index].isFavorite = newValue
                                }
                            }
                        ))
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
