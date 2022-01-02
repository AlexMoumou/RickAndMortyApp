//
//  RestClientErrors.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import Foundation

enum RestClientErrors: Error {
    case requestFailed(error: Error)
    case requestFailed(code: Int)
    case noDataReceived
    case jsonDecode(error: Error)
}
