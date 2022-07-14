//
//  AppServices.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import CoreData
import Foundation
import UIKit
import Resolver

/// Provides the necessary services.
extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        defaultScope = .graph
        registerSingletons()
        registerRemoteSources()
        registerLocalSources()
        registerRepositories()
        registerUseCases()
    }

    /// Registers singleton instances.
    private static func registerSingletons() {
        register { RestClient() as IRestClient }.scope(.application)
    }

    /// Register remote data sources.
    private static func registerRemoteSources() {
        register { CharactersRemoteSource() as ICharactersRemoteSource }
    }

    /// Register local data sources.
    private static func registerLocalSources() {
        
    }

    /// Register repositories.
    private static func registerRepositories() {
        register { CharacterRepo() as ICharacterRepo }
    }

    /// Registers use cases.
    private static func registerUseCases() {
        register { GetCharactersPageUC() }.implements(IGetCharactersPageUC.self)
    }
}

