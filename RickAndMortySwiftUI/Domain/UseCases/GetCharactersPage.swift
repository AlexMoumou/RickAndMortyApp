//
//  GetCharactersPage.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation
import Combine
import Resolver

/// Observe `Character`s
protocol IGetCharactersPageUC {
    func execute(page: Int) -> AnyPublisher<CharacterListState, Error>
}

class GetCharactersPageUC: IGetCharactersPageUC {
    @Injected private var charactersRepo: ICharacterRepo

    func execute(page: Int) -> AnyPublisher<CharacterListState, Error> {
        return charactersRepo.getCharacters(page: page)
    }
}
