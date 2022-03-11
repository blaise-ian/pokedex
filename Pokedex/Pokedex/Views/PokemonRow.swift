//
//  PokemonRow.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokemonRow: View {
    var pokemon: PokemonListItem
    
    var body: some View {
        HStack {
            Image("pokeball")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25)
                
            Text(pokemon.name.capitalized)
            Spacer()
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(pokemon: pokemonList.results[2])
    }
}
