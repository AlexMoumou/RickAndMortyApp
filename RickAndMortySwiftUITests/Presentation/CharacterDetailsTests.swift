//
//  CharacterDetailsTests.swift
//  RickAndMortySwiftUITests
//
//  Created by Alex Moumoulides on 11/7/22.
//

import XCTest
@testable import RickAndMortySwiftUI
import SnapshotTesting
import SwiftUI

class CharacterDetailsTests: XCTestCase {

    var charactersVM: CharactersVM!
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        charactersVM = CharactersVM()
        charactersVM.charactersList = [Character.example(),
                                       Character.example().copyWith(id: 2, name: "name"),
                                       Character.example().copyWith(id: 3, name: "name"),
                                       Character.example().copyWith(id: 4, name: "name"),
                                       Character.example().copyWith(id: 5, name: "name")]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        charactersVM = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultCharacterDetailsSnapshot() throws {
        let charDets = CharacterDetailsView(character: Character.example())
        assertSnapshot(matching: charDets.toVC(), as: .image)
    }
    
    func testDefaultCharacterTileSnapshot() throws {
        let charTile = CharacterTile(character: Character.example())
        assertSnapshot(matching: charTile.toVC(), as: .image)
    }
    
    func testDefaultCharactersViewSnapshot() throws {
        let charactersView = CharactersView(vm: self.charactersVM)
        
        assertSnapshot(matching: charactersView.toVC(), as: .image)
    }
}

extension SwiftUI.View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
