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
                        NavigationLink(destination: CharacterDetailsView(character: character)) {
                            CharacterTile(character: character)
                        }
                    }.listStyle(.grouped)
                    
                    if(vm.hasMorePages) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .onAppear {
                                vm.loadPage()
                            }.disabled(!vm.hasMorePages)
                    }
                    
                    
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
