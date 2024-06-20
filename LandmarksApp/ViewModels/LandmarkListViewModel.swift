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

    func updateLandmark(_ landmark: Landmark) {
        if let index = modelData.landmarks.firstIndex(where: { $0.id == landmark.id }) {
            modelData.landmarks[index] = landmark
        }
    }
}
