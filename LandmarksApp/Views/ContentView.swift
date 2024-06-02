//
//  ContentView.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 18.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
