//
//  CharactersView.swift
//  RickAndMortySwiftUI
//
//  Created by Alex Moumoulides on 30/12/21.
//

import SwiftUI
import Resolver

struct CharactersView: View {
    
    @StateObject var vm: CharactersVM
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    
                    ForEach (vm.charactersList) { character in
                        CharacterTile(character: character)
                    }.listStyle(.grouped)
                    
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            vm.loadNextPage()
                        }.disabled(!vm.hasMorePages)
                    
                }.navigationTitle("Rick and Morty")
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(vm: CharactersVM())
    }
}
