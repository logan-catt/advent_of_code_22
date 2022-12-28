//
//  Food.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import Foundation

struct Food: Identifiable {
    var id: UUID
    let calories: Int
    
    init(calories: Int) {
        self.id = UUID()
        self.calories = calories
    }
}
