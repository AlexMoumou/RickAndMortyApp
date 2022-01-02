//
//  RickAndMortySwiftUIApp.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import SwiftUI

@main
struct RickAndMortySwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersView(vm: CharactersVM())
        }
    }
}
