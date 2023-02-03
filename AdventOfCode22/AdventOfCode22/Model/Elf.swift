import Foundation

struct Elf: Identifiable {
    var id: Int
    var food: Array<Food>
    
    var totalCalories: Int {
        food.reduce(into: 0, { $0 += $1.calories })
    }
}
