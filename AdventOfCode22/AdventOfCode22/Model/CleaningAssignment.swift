import Foundation

struct CleaningAssignment: Identifiable {
    let id = UUID()
    let startSection: Int
    let endSection: Int
}

struct CleaningPair: Identifiable {
    let id = UUID()
    let assignOne: CleaningAssignment
    let assignTwo: CleaningAssignment
    
    var fullyContained: Bool {
        return (assignOne.startSection >= assignTwo.startSection && assignOne.endSection <= assignTwo.endSection) ||
        (assignTwo.startSection >= assignOne.startSection && assignTwo.endSection <= assignOne.endSection)
    }
    
    var overlap: Bool {
        return (assignOne.startSection..<(assignOne.endSection+1)).overlaps(assignTwo.startSection..<(assignTwo.endSection+1))
    }
}
