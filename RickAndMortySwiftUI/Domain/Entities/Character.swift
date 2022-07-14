//
//  Character.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import Foundation

struct Character: Equatable, Identifiable {
    let id: Int
    let name, status, species: String
    let gender: String
    let image: String
    let url: String
    let location: Location
}

extension Character {
    
    static func example() -> Character {
        return Character(id: 1,
                         name: "Rick Sanchez",
                         status: "Alive",
                         species: "Human",
                         gender: "Male",
                         image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                         url: "https://rickandmortyapi.com/api/location/3",
                         location: Location.example())
    }
    
    func copyWith(
        id: Int? = nil,
        name: String? = nil,
        status: String? = nil,
        species: String? = nil,
        gender: String? = nil,
        image: String? = nil,
        url: String? = nil,
        location: Location? = nil
    ) -> Character {
            return Character(
                id: id ?? self.id,
                name: name ?? self.name,
                status: status ?? self.status,
                species: species ?? self.species,
                gender: gender ?? self.gender,
                image: image ?? self.image,
                url: url ?? self.url,
                location: location ?? self.location
            )
    }
}
