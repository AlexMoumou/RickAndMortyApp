//
//  CharacterRepo.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation
import Combine
import Resolver

class CharacterRepo: ICharacterRepo {
    
    @Injected private var characterRemoteSource: ICharactersRemoteSource
    
    func getCharacters(page: Int) -> AnyPublisher<CharacterListState, Error> {
        characterRemoteSource.getCharacters(page: page)
    }
    
    func getCharacter(by id: Int) -> AnyPublisher<Character?, Error> {
        characterRemoteSource.getCharacter(by: id)
    }
}
