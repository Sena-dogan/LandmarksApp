//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 28.05.2024.
//

import SwiftUI

struct LandmarkDetail: View {
    @ObservedObject var viewModel: LandmarkDetailViewModel
    @Binding var isFavorite: Bool

    var body: some View {
        ScrollView {
            MapView(coordinate: viewModel.landmark.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: viewModel.landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.landmark.name).font(.title)
                    FavoriteButton(isSet: $isFavorite)
                        .onChange(of: isFavorite) { newValue in
                            viewModel.toggleFavorite()
                        }
                }
                HStack {
                    Text(viewModel.landmark.park)
                    Spacer()
                    Text(viewModel.landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About \(viewModel.landmark.name)")
                    .font(.title2)
                    .padding(.bottom, 2)
                Text(viewModel.landmark.description)
                    .font(.body)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(viewModel.landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        let landmark = modelData.landmarks[0]
        LandmarkDetail(viewModel: LandmarkDetailViewModel(landmark: landmark, listViewModel: LandmarkListViewModel(modelData: modelData)), isFavorite: .constant(landmark.isFavorite))
            .environmentObject(modelData)
    }
}
