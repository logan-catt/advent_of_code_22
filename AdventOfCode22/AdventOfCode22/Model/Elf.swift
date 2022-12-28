//
//  Elf.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import Foundation

struct Elf: Identifiable {
    var id: Int
    var food: Array<Food>
    
    var totalCalories: Int {
        food.reduce(into: 0, { $0 += $1.calories })
    }
}
