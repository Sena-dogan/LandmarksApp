//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 28.05.2024.
//

import SwiftUI

struct LandmarkList: View {
    
    //The @Environment property wrapper enables you to read the model data of the current view. Adding an environment(_:) modifier passes the data object down through the environment.
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)}
    }
    var body: some View {
        // Bu kısım, her öğenin benzersiz bir kimliğe sahip olduğunu belirtir.
        // '\.id', landmarks koleksiyonundaki her öğenin 'id' adlı bir özelliğe sahip olduğunu ve bu özelliğin her öğeyi benzersiz olarak tanımlamak için kullanılacağını belirtir.
        
        //List(landmarks, id: \.id){ landmark in
        //    LandmarkRow(landmark: landmark)
        //}
        
        // 'landmark' adında bir değişken kullanılır ve bu değişken her döngüde 'landmarks' dizisindeki bir öğeyi temsil eder.
        
        // after adding Identifiable protocol in the Landmark.swift
        
        NavigationSplitView {
            
            //To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List.
            
            List{
                
                // Use the $ prefix to access a binding to a state variable, or one of its properties
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
            LandmarkList()
                .environmentObject(ModelData())
        }
}
