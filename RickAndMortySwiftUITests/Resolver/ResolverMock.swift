//
//  ResolverMock.swift
//  RickAndMortySwiftUITests
//
//  Created by Alex Moumoulides on 15/7/22.
//

import Foundation
import Resolver
@testable import RickAndMortySwiftUI

extension Resolver {
    // MARK: - Mock Container
    static var mock = Resolver(parent: .main)

    // MARK: - Register Mock Services
    static func registerMockServices() {
    root = Resolver.mock
    defaultScope = .application
    Resolver.mock.register { IGetCharactersPageUCMock() }.implements(IGetCharactersPageUC.self)
    }
}
