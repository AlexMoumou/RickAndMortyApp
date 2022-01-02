//
//  CharacterRemoteSource.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation
import Combine
import Resolver

protocol ICharactersRemoteSource {
    func getCharacters(page: Int) -> AnyPublisher<[Character], Error>
    func getCharacter(by id: Int) -> AnyPublisher<Character?, Error>
}

class CharactersRemoteSource: ICharactersRemoteSource {
    
    @Injected private var restClient: IRestClient
    
    func getCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        restClient.get(RickAndMortyApiEndpoint.characters(page))
            .map { (charactersResponse: CharactersResponseDTO) in
                charactersResponse.characters.map { $0.mapToDomain() }
            }.eraseToAnyPublisher()
    }
    
    func getCharacter(by id: Int) -> AnyPublisher<Character?, Error> {
        restClient.get(RickAndMortyApiEndpoint.character(id))
            .map { (character: CharacterDTO?) in
                character?.mapToDomain()
            }
            .eraseToAnyPublisher()
    }
    
    //    func post(answer: Answer) -> AnyPublisher<Answer, Error> {
    //        restClient.post(SurveyApiEndpoint.questionSubmit, using: answer.mapToRemote())
    //            .map { _ in
    //                answer
    //            }.eraseToAnyPublisher()
    //    }
}

