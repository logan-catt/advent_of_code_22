//
//  Rucksack.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/28/22.
//

import Foundation

struct RucksackGroup: Identifiable {
    let id: Int
    let rucksacks: Array<Rucksack>
    var badge: Character?
    var priority: UInt8 {
        badge?.priority() ?? 0
    }
    
    init(id: Int, rucksacks: Array<Rucksack>) {
        self.id = id
        self.rucksacks = rucksacks
        determineBadge()
    }
    
    mutating func determineBadge() {
        rucksacks.first?.allItems.forEach { item in
            if rucksacks[1].allItems.contains(item),
               rucksacks[2].allItems.contains(item) {
                self.badge = item
            }
        }
    }
}

struct Rucksack: Identifiable {
    let id = UUID()
    let allItems: String
    let compartmentOne: String
    let compartmentTwo: String
    var sharedItemType: Character?
    var priority: UInt8 {
        sharedItemType?.priority() ?? 0
    }
    
    init(contents: String) {
        let halfLength = contents.count / 2
        self.allItems = contents
        self.compartmentOne = String(contents.prefix(halfLength))
        self.compartmentTwo = String(contents.suffix(halfLength))
        determineSharedItemType()
    }
    
    mutating func determineSharedItemType() {
        compartmentOne.forEach { item in
            if compartmentTwo.contains(item) {
                self.sharedItemType = item
            }
        }
    }
}

extension Character {
    func priority() -> UInt8 {
        guard let itemType = self.asciiValue else {
            return 0
        }
        
        if itemType <= 90 {
            return itemType - 38
        } else {
            return itemType - 96
        }
    }
}
