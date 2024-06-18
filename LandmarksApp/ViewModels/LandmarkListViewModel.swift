//
//  LandmarkListViewModel.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 16.06.2024.
//

import Foundation

class LandmarkListViewModel: ObservableObject {
    @Published var modelData: ModelData
    @Published var showFavoritesOnly: Bool = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    init(modelData: ModelData) {
        self.modelData = modelData
    }
}

