//
//  ContentView.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/1/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var data: Pokemon?
    
    var body: some View {
        VStack {
            PokeList()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


func downloadPokeData() {
    let task = Process()
    
    let executableUrl = URL(fileURLWithPath: "/bin/sh")
    task.executableURL = executableUrl
    
    let pipe = Pipe()
    task.standardOutput = pipe
    
    task.currentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let args = ["pokelist.sh"]

    task.arguments = args
    
    task.terminationHandler = {
        _ in
        print("process run complete")
    }
    try! task.run()
    task.waitUntilExit()
    
    
    let d = pipe.fileHandleForReading.readDataToEndOfFile()
    let ds = String(data:d, encoding: String.Encoding.utf8)
    print("terminal out: \(ds!)")
    print("execution complete")

}

