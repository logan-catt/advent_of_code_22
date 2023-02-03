import Foundation

struct Food: Identifiable {
    var id: UUID
    let calories: Int
    
    init(calories: Int) {
        self.id = UUID()
        self.calories = calories
    }
}
