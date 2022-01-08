//
//  CharacterDTO.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import Foundation

struct CharacterDTO: Codable, CustomStringConvertible {
    let id: Int
    let name: String
    let status: Status
    let species, type: String
    let gender: Gender
    let origin, location: LocationDTO
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension CharacterDTO {
    func mapToDomain() -> Character {
        Character(id: id,
                  name: name,
                  status: status.rawValue,
                  species: species,
                  gender: gender.rawValue,
                  image: image,
                  url: url,
                  location: location.mapToDomain())
    }
}

enum Gender: String, Codable {
    case female = "Female"
        case genderless = "Genderless"
        case male = "Male"
        case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
