//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 28.05.2024.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // Bu kısım, her öğenin benzersiz bir kimliğe sahip olduğunu belirtir.
        // '\.id', landmarks koleksiyonundaki her öğenin 'id' adlı bir özelliğe sahip olduğunu ve bu özelliğin her öğeyi benzersiz olarak tanımlamak için kullanılacağını belirtir.
        
        //List(landmarks, id: \.id){ landmark in
        //    LandmarkRow(landmark: landmark)
        //}
        
        // 'landmark' adında bir değişken kullanılır ve bu değişken her döngüde 'landmarks' dizisindeki bir öğeyi temsil eder.
        
        // after adding Identifiable protocol in the Landmark.swift
        
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
