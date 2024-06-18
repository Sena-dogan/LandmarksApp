//
//  LandmarkDetailViewModel.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 16.06.2024.
//

import Foundation

class LandmarkDetailViewModel: ObservableObject {
    @Published var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    init(modelData: ModelData, landmark: Landmark) {
        self.modelData = modelData
        self.landmark = landmark
    }
}

