//
//  GetCharacterDetails.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 2/7/22.
//

import Foundation
import Combine
import Resolver

/// Observe `Character`s
protocol IGetCharacterDetailsUC {
    func execute(id: Int) -> AnyPublisher<Character?, Error>
}

class GetCharacterDetailsUC: IGetCharacterDetailsUC {
    @Injected private var charactersRepo: ICharacterRepo

    func execute(id: Int) -> AnyPublisher<Character?, Error> {
        return charactersRepo.getCharacter(by: id)
    }
}
