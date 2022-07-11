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
                        .buttonStyle(CustomButtonStyle())
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

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .blur(radius: configuration.isPressed ? 0.8 : 0.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeIn, value: configuration.isPressed ? 0.8 : 1.0)
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(vm: CharactersVM())
    }
}
