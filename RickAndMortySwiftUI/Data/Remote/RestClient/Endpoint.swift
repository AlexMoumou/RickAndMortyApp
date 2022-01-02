//
//  Endpoint.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import Foundation

protocol Endpoint {
    var url: URL { get }
    var path: String { get }
}

/// BaseUrl of Rick and Morty API Endpoint
private let baseURL = URL(string: "https://rickandmortyapi.com/api/")

/// API Endpoints
enum RickAndMortyApiEndpoint: Endpoint {

    case characters(Int)
    case character(Int)
    case locations
    case location(Int)

    var path: String {
        switch self {
        case .characters(let page): return "character/?page=\(page)"
        case .character(let id): return "character/\(id)"
        case .locations: return "location"
        case .location(let id): return "location/\(id)"
        }
    }

    var url: URL {
        return URL(string: self.path, relativeTo: baseURL)!
    }
}
