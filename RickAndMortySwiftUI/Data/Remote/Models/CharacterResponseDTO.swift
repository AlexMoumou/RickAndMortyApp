//
//  CharacterResponseDTO.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation

// MARK: - CharactersResponseDTO
struct CharactersResponseDTO: Codable {
    let info: Info
    let characters: [CharacterDTO]
}

extension CharactersResponseDTO {
    enum CodingKeys: String, CodingKey {
        case characters = "results"
        case info
    }
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next, prev: String?
}
