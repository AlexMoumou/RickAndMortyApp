//
//  CharacterDetailsView.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 2/7/22.
//

import Foundation
import SwiftUI
import Resolver
import Kingfisher

struct CharacterDetailsView: View {
    
    let character: Character
    
    var body: some View {
        VStack {
            KFImage(URL(string: character.image)).resizable().scaledToFit()
            HStack(alignment: .top, spacing: 100) {
                Text("Gender: \(character.gender)")
                Text("Species: \(character.species)")
                Spacer()
            }

            Spacer()
        }.navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.large)
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: Character.example())
    }
}
