//
//  ElfDetailView.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import SwiftUI

struct ElfDetailView: View {
    var elf: Elf
    
    var body: some View {
        VStack {
            elfProfile
            
            List{
                Section(header: Text("Food"), footer: Text("\(elf.totalCalories) calories")) {
                    ForEach(elf.food) { food in
                        Text("\(food.calories) calories")
                    }
                }
            }
            .listStyle(.grouped)
        }
    }
    
    var elfProfile: some View {
        HStack(alignment: .top) {
            Image("elf.fill")
                .resizable()
                .frame(width: 150, height: 150)
            
            VStack {
                Text("Elf \(elf.id)")
                    .font(.headline)
                Text("id: \(elf.id)")
            }
            
            Spacer()
        }
    }
}

struct ElfDetailView_Previews: PreviewProvider {
    static var sampleElf: Elf = .init(id: 1, food: [
        Food(calories: 100),
        Food(calories: 200),
        Food(calories: 300)
    ])
    static var previews: some View {
        ElfDetailView(elf: sampleElf)
    }
}
