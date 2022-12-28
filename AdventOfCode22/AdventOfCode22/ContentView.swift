//
//  ContentView.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ElfListView()
                } label: {
                    HStack {
                        Image("elf.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Elves")
                    }
                }
                
                NavigationLink {
                    RockPaperScissorsView()
                } label: {
                    HStack {
                        Image(systemName: "scissors")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                        Text("Rock, Paper, Scissors")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
