//
//  CharacterTile.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 1/1/22.
//

import SwiftUI
import Kingfisher

struct CharacterTile: View {
    
    let character: Character
    
    var body: some View {
        HStack {
            KFImage(URL(string: character.image))
                .resizable()
                .clipShape(Circle())
                .frame(width: 100.0, height: 100.0, alignment: .center)
                .padding(.all, 20)
            VStack(alignment: .leading, spacing: 5) {
                Text(character.name).font(.title2).foregroundColor(.white)
                Text(character.status).foregroundColor(.white)
                Spacer()
            }.padding()
            Spacer()
        }.background(Color.gray.opacity(0.6))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color.black)
            .cornerRadius(10.0)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 5, y: 5)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}

struct CharacterTile_Previews: PreviewProvider {
    static var previews: some View {
        CharacterTile(character: Character.example())
    }
}
