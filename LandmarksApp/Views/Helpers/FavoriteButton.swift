//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Zeynep Sena Doğan on 1.06.2024.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(isSet ? .yellow : .gray)
                    }
        }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
