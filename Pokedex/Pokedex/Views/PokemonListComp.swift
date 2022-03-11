//
//  PokemonListComp.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemonListComp: View {
    var body: some View {
        List(pokemonList.results, id: \.name){ pokemon in
            PokemonListRow(pokemonListItem: pokemon)
        }
    }
}

struct PokemonListComp_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListComp()
    }
}
