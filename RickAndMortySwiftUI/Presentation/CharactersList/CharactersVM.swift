//
//  CharactersVM.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation
import Combine
import Resolver

enum RequestState {
    case inProgress
    case success
    case fail
    case idle
}


class CharactersVM: ObservableObject {
    @Injected private var getCharactersPage: IGetCharactersPageUC
    
    @Published var requestState: RequestState = .idle
    @Published var charactersList : [Character] = []
    
    private var cancelables = [AnyCancellable]()
    private var page = 0
    private var totalPages = 0

    init() {
        loadNextPage()
    }
    
    private func loadNextPage() {
        print("loading more characters")
        getCharactersPage.execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.charactersList = response
            })
            .store(in: &cancelables)
    }
}
