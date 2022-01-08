//
//  ICharacterRepo.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation
import Combine

protocol ICharacterRepo {
    func getCharacters(page: Int) -> AnyPublisher<CharacterListState, Error>
    func getCharacter(by id: Int) -> AnyPublisher<Character?, Error>
}
