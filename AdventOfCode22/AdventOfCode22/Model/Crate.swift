import Foundation

struct Crate: Identifiable {
    let id = UUID()
    let label: String
}

struct Stack: Identifiable {
    let id: Int
    var crates: Array<Crate> = []
    
    mutating func removeCrates(_ numberToRemove: Int) -> Array<Crate> {
        var removed: Array<Crate> = []
        for _ in (0..<numberToRemove) {
            if !crates.isEmpty {
                removed.append(crates.removeFirst())
            }
        }
        
        return removed
    }
    
    mutating func addCrates(_ newCrates: Array<Crate>) {
        crates.insert(contentsOf: newCrates, at: 0)
    }
}

class Stacks: ObservableObject {
    @Published var stacks: Array<Stack> = []
    
    init(stacks: Array<Stack>) {
        self.stacks = stacks
    }
}

struct MovementInstruction {
    let numberToMove: Int
    let startStack: Int
    let endStack: Int
    let stringRepresentation: String
}
