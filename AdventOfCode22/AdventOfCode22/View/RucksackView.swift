//
//  RucksackView.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/28/22.
//

import SwiftUI

struct RucksackView: View {
    @State private var rucksacks: Array<RucksackGroup> = []
    
    var body: some View {
        VStack {
            ScrollView {
                List {
                    ForEach(rucksacks) { group in
                        Section {
                            ForEach(group.rucksacks) { rucksack in
                                Text(rucksack.allItems)
                                Spacer()
                                Text("\(rucksack.priority)")
                            }
                        } header: {
                            HStack {
                                Text("Group \(group.id)")
                                Spacer()
                                Text("\(group.priority)")
                            }
                        }
                    }
                }
            }
            
            HStack {
                Text("Total priority")
                Spacer()
                Text("\(calculateTotalPriority())")
            }
            
            HStack {
                Text("Total group priority")
                Spacer()
                Text("\(calculateGroupPriority())")
            }
        }
        .padding()
        .navigationTitle("Rucksacks")
        .onAppear {
            loadRucksackInventory()
        }
    }
    
    func calculateTotalPriority() -> Int {
        var sum = 0
        rucksacks.forEach { rucksackGroup in
            rucksackGroup.rucksacks.forEach { rucksack in
                sum += Int(rucksack.priority)
            }
        }
        
        return sum
    }
    
    func calculateGroupPriority() -> Int {
        var sum = 0
        rucksacks.forEach { rucksackGroup in
            sum += Int(rucksackGroup.priority)
        }
        
        return sum
    }
    
    func loadRucksackInventory() {
        rucksacks = InputReaderClient.rucksackInventory()
    }
}

struct RucksackView_Previews: PreviewProvider {
    static var previews: some View {
        RucksackView()
    }
}
