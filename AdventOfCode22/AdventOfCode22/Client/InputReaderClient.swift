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
    
    static func rucksackInventory() -> Array<RucksackGroup> {
        let filePath = Bundle.main.url(forResource: "rucksack_inventory", withExtension: nil)
        var rucksacks: Array<RucksackGroup> = []
        
        do {
            let contents = try String(contentsOf: filePath!)
            let lines = contents.split(separator: "\n")
            
            var groupId = 1
            var groupRucksacks: Array<Rucksack> = []
            
            lines.forEach { line in
                groupRucksacks.append(Rucksack(contents: "\(line)"))
                
                if groupRucksacks.count == 3 {
                    let newGroup = RucksackGroup(id: groupId, rucksacks: groupRucksacks)
                    rucksacks.append(newGroup)
                    groupId += 1
                    groupRucksacks = []
                }
            }
        } catch {
            print(error)
        }
        
        return rucksacks
    }
    
    static func cleaningAssignments() -> Array<CleaningPair> {
        let filePath = Bundle.main.url(forResource: "cleaning_assignments", withExtension: nil)
        var assignments: Array<CleaningPair> = []
        
        do {
            let contents = try String(contentsOf: filePath!)
            let lines = contents.split(separator: "\n")
            
            lines.forEach { line in
                let sections = line.components(separatedBy: .decimalDigits.inverted)
                
                let assignOne = CleaningAssignment(startSection: Int(sections[0]) ?? -1, endSection: Int(sections[1]) ?? -1)
                let assignTwo = CleaningAssignment(startSection: Int(sections[2]) ?? -1, endSection: Int(sections[3]) ?? -1)
                
                assignments.append(CleaningPair(assignOne: assignOne, assignTwo: assignTwo))
            }
        } catch {
            print(error)
        }
        
        return assignments
    }
    
    static func crateRearrangement() -> (Array<Stack>, Array<MovementInstruction>) {
        let filePath = Bundle.main.url(forResource: "crate_rearrangement", withExtension: nil)
        var stacks = [ Stack(id: 1), Stack(id: 2), Stack(id: 3), Stack(id: 4), Stack(id: 5), Stack(id: 6), Stack(id: 7), Stack(id: 8), Stack(id: 9)]
        var movements: Array<MovementInstruction> = []
        
        do {
            let contents = try String(contentsOf: filePath!)
            let lines = contents.split(separator: "\n")
            
            let initialArrangement = lines.filter({ $0.contains("[") })
            let movementInstructions = lines.filter({ $0.contains("move")})
            
            // Read initial arrangement
            initialArrangement.forEach { row in
                let placements = row.split(separator: " ")
                
                placements.indices.forEach { stackIndex in
                    if placements[stackIndex].contains("[") {
                        stacks[stackIndex].crates.append(Crate(label: "\(placements[stackIndex])"))
                    }
                }
            }
            
            // Read movement instructions
            movementInstructions.forEach { instruction in
                var values = instruction.components(separatedBy: .decimalDigits.inverted)
                values.removeAll(where: { $0 == "" })
                movements.append(MovementInstruction(numberToMove: Int(values[0]) ?? 0, startStack: Int(values[1]) ?? 0, endStack: Int(values[2]) ?? 0, stringRepresentation: "\(instruction)"))
            }
        } catch {
            print(error)
        }
        
        return (stacks, movements)
    }
}
