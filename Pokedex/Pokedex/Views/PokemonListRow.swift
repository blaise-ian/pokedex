//
//  PokemonListRow.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemonListRow: View {
    var pokemonListItem: PokemonListItem
    
    var body: some View {
        
        HStack {
            Text("\(pokemonListItem.name)")
                .padding()
                .border(Color.red, width: 4)
                .background(Color.white)
                .foregroundColor(Color.blue).frame(maxWidth: .infinity, alignment: Alignment.leading)
            Spacer()
        }
        
        
    }
}

struct PokemonListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonListRow(pokemonListItem: pokemonList.results[0])
            PokemonListRow(pokemonListItem: pokemonList.results[1])
                
        }.previewLayout(.fixed(width: 300, height: 50))
    }
}


