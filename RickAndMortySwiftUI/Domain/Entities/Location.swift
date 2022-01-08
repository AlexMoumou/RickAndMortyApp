//
//  Location.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 8/1/22.
//

import Foundation

struct Location: Equatable {
    let name: String
    let url: String
}

extension Location {
    static func example() -> Location {
        return Location(name: "Earth", url: "url")
    }
}
