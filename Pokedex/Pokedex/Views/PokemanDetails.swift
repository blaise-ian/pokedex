//
//  PokemanDetails.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemanDetails: View {
    
    var pokemonName: String
    
    @State var data: Pokemon?
    
    @State private var hasFocus = false
    
    func getData() {
        let urlString = APIUrl + pokemonName
        let url = URL(string: urlString)
        print("Getting data for \(pokemonName)")
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async { // learn this
                if let data = data {
                    do{
                        let decoder = JSONDecoder()
                        
                        let decodedData = try decoder.decode(Pokemon.self, from:data)
                        print("Decoded?")
                        self.data = decodedData
                    } catch {
                        print("Error!: \(error)")
                    }
                }
            }
        }.resume()
    }
    @Environment(\.openURL) var openURL
    var body: some View {
        
        HStack {
            VStack {
                HStack{
                    if let typeElements = data?.types { // dont unwrap like this
                        let pokeType : String = typeElements[0].type.name
                        let color : Color = PokemonType.getColor(typeElement: pokeType)
                        
                        ///The official artwork looks much nicer, but there are more sprites available...
                        //if let unwrapped = data?.sprites.other?.officialArtwork.frontDefault {
                        Button(action: {
                            var imageWindow: NSWindow!
                            let imageView = PokemonImage(imageUrl: data?.sprites.other?.officialArtwork.frontDefault ?? "" )
                            // Create the preferences window and set content
                            imageWindow = NSWindow(
                                contentRect: NSRect(x: 20, y: 20, width: 480, height: 300),
                                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                                backing: .buffered,
                                defer: false)
                            imageWindow.center()
                            imageWindow.setFrameAutosaveName("PokemonImage")
                            imageWindow.contentView = NSHostingView(rootView: imageView)
                            imageWindow.makeKeyAndOrderFront(nil)
                            imageWindow.isReleasedWhenClosed = false
                        }){
                            if let unwrapped = data?.sprites.frontDefault {
                                AsyncImage(url: URL(string: unwrapped)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 125, height: 125)
                                            .clipShape(Circle())
                                            .overlay {
                                                //getColor(typeElement: data?.types[0].type.name)
                                                Circle().stroke(color, lineWidth: 4)
                                            }
                                            .shadow(color: .yellow, radius: 2)
                                            .padding()
                                    case .failure:
                                        Text("Image missing")
                                    @unknown default:
                                        // Since the AsyncImagePhase enum isn't frozen,
                                        // we need to add this currently unused fallback
                                        // to handle any new cases that might be added
                                        // in the future:
                                        EmptyView()
                                    }
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                HStack{
                    if let unwrapped = data?.name {
                        Text("\(unwrapped.capitalized)")
                            .font(.largeTitle)
                    } else {
                        
                    }
                }
                PokemonType(pokemonType: data)
                    .padding(.bottom, 10)
                Spacer()
            }
            .onAppear(perform: getData)
            .padding()
            VStack{
                PokemonStats(pokemonDetails: data)
                Spacer()
            }
        }
    }
}

struct PokemanDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemanDetails(pokemonName: "Bulbasaur")
    }
}
