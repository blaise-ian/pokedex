//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/1/22.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup("ImageViewer") { // other scene
            PokemonImage(imageUrl: "test").handlesExternalEvents(preferring: Set(arrayLiteral: "viewer"), allowing: Set(arrayLiteral: "*")) // activate existing window if exists
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "viewer")) // create new window if one doesn't exist
    }
}
