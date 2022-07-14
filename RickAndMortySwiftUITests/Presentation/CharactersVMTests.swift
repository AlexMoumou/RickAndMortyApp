//
//  CharactersVMTests.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 11/7/22.
//

import XCTest
@testable import RickAndMortySwiftUI
import Combine
import Resolver

class IGetCharactersPageUCMock: IGetCharactersPageUC {
    
    var charListState: CharacterListState?
    
    func execute(page: Int) -> AnyPublisher<CharacterListState, Error> {
        guard let state = charListState else {
          fatalError("Result is nil")
        }
        
        return Just(state)
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}

class CharactersVMTests: XCTestCase {
    
    @LazyInjected var getCharsUC: IGetCharactersPageUCMock
    var sut: CharactersVM?
    
    override func setUp() {
        super.setUp()
        
        Resolver.registerMockServices()
        
    }
    
    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    func testVMGetsCorrectData() async throws {
        
        getCharsUC.charListState = CharacterListState(info: Info(count: 10,
                                                                 pages: 15,
                                                                 next: "next",
                                                                 prev: "prev"),
                                                      characters: [Character.example().copyWith(name: "alex")])
        
        sut = CharactersVM()
        
        waitForValue(of: sut!.$charactersList, value: [Character.example().copyWith(name: "alex")])
        waitForValue(of: sut!.$hasMorePages, value: true)
    }
    
    func testHasMorePagesIsFalseWhenPages_1() async throws {
        
        getCharsUC.charListState = CharacterListState(info: Info(count: 10,
                                                                 pages: 1,
                                                                 next: "next",
                                                                 prev: "prev"),
                                                      characters: [])
        
        sut = CharactersVM()
        
        waitForValue(of: sut!.$hasMorePages, value: false)
    }

}
