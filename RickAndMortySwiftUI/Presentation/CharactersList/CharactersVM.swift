//
//  CharactersVM.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 31/12/21.
//

import Foundation
import Combine
import Resolver
import SwiftUI

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
    //    @State private var info: Info? = nil
    
    private var cancelables = [AnyCancellable]()
    private var page = 1
    private var totalPages = 0
    @Published var hasMorePages = false
    
    init() {
        loadPage()
    }
    
    func loadPage() {
        getCharactersPage.execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.totalPages = response.info.pages
                self?.page += 1
                self?.charactersList.append(contentsOf: response.characters)
                
                if let pages = self?.page, let total = self?.totalPages, total > pages {
                    self?.hasMorePages = true
                } else {
                    self?.hasMorePages = false
                }
            })
            .store(in: &cancelables)
    }
}
