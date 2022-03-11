//
//  PokemonStats.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokemonStats: View {
    var pokemonDetails: Pokemon?
    
    var body: some View {
        VStack{
            HStack {
                Text("Stats")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                Spacer()
            }
            if let unwrapped = pokemonDetails?.stats {
                
                ProgressView("HP: \(unwrapped[0].baseStat)", value: Double(unwrapped[0].baseStat), total: 150)
                    .tint(.green)
                    
                ProgressView("Attack: \(unwrapped[1].baseStat)", value: Double(unwrapped[1].baseStat), total: 150)
                    .tint(.red)
                ProgressView("Defense: \(unwrapped[2].baseStat)", value: Double(unwrapped[2].baseStat), total: 150)
                    .tint(.blue)
                ProgressView("Speed: \(unwrapped[3].baseStat)", value: Double(unwrapped[3].baseStat), total: 150)
                    .tint(.yellow)
                ProgressView("Special Attack: \(unwrapped[4].baseStat)", value: Double(unwrapped[4].baseStat), total: 150)
                    .tint(.red)
                ProgressView("Special Defense: \(unwrapped[5].baseStat)", value: Double(unwrapped[5].baseStat), total: 150)
                    .tint(.blue)

                
            }
            /*
            HStack{
                
                HStack {
                    //Text("HP: ")
                    //    .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                    //    Text(String(unwrapped[0].baseStat))
                        ProgressView("HP", value: Double(unwrapped[0].baseStat), total: 120)
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    //Text("Attack: ")
                        //.font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        //Text(String(unwrapped[1].baseStat))
                        ProgressView("Attack", value: Double(unwrapped[0].baseStat), total: 120)
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    //Text("Defense: ")
                    //    .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        //Text(String(unwrapped[2].baseStat))
                        ProgressView("Defense", value: Double(unwrapped[0].baseStat), total: 120)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
            HStack{
                HStack {
                    Text("Speed: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[5].baseStat))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Special Attack: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[4].baseStat))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Special Defense: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[3].baseStat))
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
              */
        }
        .padding()
       // .overlay(
        //    RoundedRectangle(cornerRadius: 16)
        //        .stroke(Color.primary, lineWidth: 2)
       // )
           
    }
}

struct PokemonStats_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStats()
    }
}
