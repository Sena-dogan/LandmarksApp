//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 28.05.2024.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = ModelData().landmarks
        VStack {
            LandmarkRow(landmark: landmarks[0])
                .previewDisplayName(landmarks[0].name)
            LandmarkRow(landmark: landmarks[1])
            .previewDisplayName(landmarks[1].name)
        }
    }
}

