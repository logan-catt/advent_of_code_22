//
//  ElfListView.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import SwiftUI

struct ElfListView: View {
    @State private var elves: Array<Elf>
    
    init() {
        self.elves = []
    }
    
    var body: some View {
        List(elves) { elf in
            NavigationLink {
                ElfDetailView(elf: elf)
            } label: {
                ElfCellView(elf: elf)
            }
        }
        .navigationTitle("Elves")
        .onAppear {
            loadElves()
        }
    }
    
    func loadElves() {
        self.elves = InputReaderClient.elfFoodCalories()
    }
}

struct ElfListView_Previews: PreviewProvider {
    static var previews: some View {
        ElfListView()
    }
}
