//
//  PokeList.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokeList: View {
    @State private var filterPokemon: String = ""

    var body: some View {
        VStack {
            TextField("Filter Pokemon", text: $filterPokemon)
            NavigationView {
                List (pokemonList.results.filter { $0.name.starts(with: filterPokemon.lowercased())}, id: \.name){ pokemon in
                    NavigationLink {
                        PokemanDetails(pokemonName: pokemon.name)
                    } label: {
                        PokemonRow(pokemon: pokemon)
                    }        .frame(width:200)
                }
                .navigationTitle("Pokemon")
                
            }
        }
    }
}

struct PokeList_Previews: PreviewProvider {
    static var previews: some View {
        PokeList()
    }
}
