//
//  PokemonType.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokemonType: View {
    var pokemonType: Pokemon?
    
    public static func getColor(typeElement: String) -> Color {
       // if let types = typeElement {
                switch typeElement {
                    case "normal":
                        return Color.gray
                    case "poison":
                        return Color.orange
                    case "fire":
                        return Color.red
                    case "water":
                        return Color.blue
                    case "grass":
                        return Color.green
                    case "flying":
                        return Color.teal
                    case "bug":
                        return Color.brown
                    case "electric":
                        return Color.yellow
                    case "ice":
                        return Color.cyan
                    case "fighting":
                        return Color.gray
                    case "ground":
                        return Color.brown
                    case "psychic":
                        return Color.indigo
                    case "rock":
                        return Color.gray
                    case "ghost":
                        return Color.white
                    case "dark":
                            return Color.black
                    case "dragon":
                            return Color.mint
                    case "steel":
                            return Color.gray
                    case "fairy":
                            return Color.pink
                    default:
                            return Color.blue
            }
      //  }
    }
    
    var body: some View {
        HStack {
            if let types = pokemonType?.types {
                ForEach(types, id: \.self) { type in
                    let color = PokemonType.getColor(typeElement: type.type.name)
                    Text(type.type.name.capitalized)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius:5)
                                .stroke(color, lineWidth: 2))
                    //Text(type.type.name)
                }
                
            } else {
            
            }
        }
    }
}

struct PokemonType_Previews: PreviewProvider {
    static var previews: some View {
        PokemonType()
    }
}
