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
                .resizable(capInsets: EdgeInsets(top: .zero, leading:  .zero, bottom:  .zero, trailing:  .zero), resizingMode: .stretch)
//                            .clipShape(Circle())
                            .frame(width: 150, alignment: .leading)
//                            .padding(.all, 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                HStack {
                    Circle()
                        .fill(character.status == "Alive" ? Color.green :
                                character.status == "Dead" ? Color.red :
                                Color.gray)
                        .frame(width: 10, height: 10, alignment: .leading)
                    
                    Text(character.status + " - " + character.species).foregroundColor(.white)
                }
                Text("Last known location:").foregroundColor(Color(.systemGray2))
                Text(character.location.name).foregroundColor(.white)
                Spacer()
            }.padding()
            Spacer()
        }.background(Color.gray.opacity(0.6))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 150, alignment: .leading)
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
