//
//  Intro.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/5/22.
//

import SwiftUI

struct Intro: View {
    @State private var login = false
    var body: some View {
        
        VStack {
            if !login {
                LoginView(login: $login).frame(minWidth: 800, minHeight: 600)
            }
            if login {
                PokeList()
                   .frame(minWidth:800, minHeight:600)
                
            }
            
        }
    }
}

struct LoginView: View {
    @Binding var login: Bool
    var body: some View {
        VStack {
            Button("Login") {self.login = true}
        }
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
