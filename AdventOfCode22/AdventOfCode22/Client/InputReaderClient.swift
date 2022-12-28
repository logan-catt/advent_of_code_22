//
//  InputReaderClient.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import Foundation

struct InputReaderClient {
    static func elfFoodCalories() -> Array<Elf> {
        let filePath = Bundle.main.url(forResource: "elf_food", withExtension: nil)
        var elves: Array<Elf> = []

        do {
            let contents = try String(contentsOf: filePath!)
            let lines = contents.split(separator: "\n", omittingEmptySubsequences: false)
            
            var id = 0
            var currentElf = Elf(id: id, food: [])
            
            lines.forEach { line in
                guard !line.isEmpty else {
                    id += 1
                    elves.append(currentElf)
                    currentElf = Elf(id: id, food: [])
                    return
                }
                
                currentElf.food.append(Food(calories: Int(line) ?? 0))
            }
        } catch {
            print(error)
        }
        
        return elves
    }
    
    static func strategyGuide() -> Array<RockPaperScissors> {
        let filePath = Bundle.main.url(forResource: "strategy_guide", withExtension: nil)
        var games: Array<RockPaperScissors> = []
        
        do {
            let contents = try String(contentsOf: filePath!)
            let lines = contents.split(separator: "\n")
            
            lines.forEach { line in
                games.append(RockPaperScissors(shapes: ("\(line.first!)", "\(line.last!)")))
            }
        } catch {
            print(error)
        }
        
        return games
    }
}
