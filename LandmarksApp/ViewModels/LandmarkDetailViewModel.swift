//
//  LandmarkDetailViewModel.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 16.06.2024.
//

import Foundation

class LandmarkDetailViewModel: ObservableObject {
    @Published var landmark: Landmark
    var listViewModel: LandmarkListViewModel
    
    init(landmark: Landmark, listViewModel: LandmarkListViewModel) {
        self.landmark = landmark
        self.listViewModel = listViewModel
    }

    func toggleFavorite() {
        landmark.isFavorite.toggle()
        listViewModel.updateLandmark(landmark)
    }
}
