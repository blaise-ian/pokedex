//
//  PokemonList.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//
import Foundation
import SwiftUI


struct PokemonList: Codable {
    
    let count: Int
    let next: String
    let results: [PokemonListItem]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case results = "results"
    }
}

struct PokemonListItem: Codable {
    let name: String
    let url: String
}

