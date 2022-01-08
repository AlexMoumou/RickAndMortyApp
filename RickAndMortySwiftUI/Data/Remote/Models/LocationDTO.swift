//
//  LocationDTO.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation

struct LocationDTO: Codable {
    let name: String
    let url: String
}

extension LocationDTO {
    func mapToDomain() -> Location {
        Location(name: name, url: url)
    }
}
