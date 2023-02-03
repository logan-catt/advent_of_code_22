import Foundation

enum OpponentShape: String {
    case ROCK = "A"
    case PAPER = "B"
    case SCISSORS = "C"
}

enum PlayerShape: String {
    case ROCK = "X"
    case PAPER = "Y"
    case SCISSORS = "Z"
    
    func shapePoints() -> Int {
        switch self {
        case .ROCK:
            return 1
        case .PAPER:
            return 2
        case .SCISSORS:
            return 3
        }
    }
}

enum StrategyOutcome: String {
    case LOSE = "X"
    case DRAW = "Y"
    case WIN = "Z"
    
    func determinePlayerShape(opponentShape: OpponentShape) -> PlayerShape {
        switch (self, opponentShape) {
        case (.LOSE, .ROCK),
            (.DRAW, .SCISSORS),
            (.WIN, .PAPER):
            
            return .SCISSORS
            
        case (.LOSE, .PAPER),
            (.DRAW, .ROCK),
            (.WIN, .SCISSORS):
            
            return .ROCK
            
        default:
            return .PAPER
        }
    }
    
    func points() -> Int {
        switch self {
        case .LOSE: return 0
        case .DRAW: return 3
        case .WIN: return 6
        }
    }
}

struct RockPaperScissors: Identifiable {
    let id: UUID
    let opponentShape: OpponentShape
    let playerShape: PlayerShape
    let outcomeV2: StrategyOutcome
    
    var gameScoreV1: Int {
        return playerShape.shapePoints() + outcomeV1
    }
    
    var gameScoreV2: Int {
        return outcomeV2.determinePlayerShape(opponentShape: opponentShape).shapePoints() + outcomeV2.points()
    }
    
    private var outcomeV1: Int {
        switch (playerShape, opponentShape) {
        case (.ROCK, .ROCK),
            (.PAPER, .PAPER),
            (.SCISSORS, .SCISSORS):
            return 3
        case (.ROCK, .SCISSORS),
            (.SCISSORS, .PAPER),
            (.PAPER, .ROCK):
            return 6
        default:
            return 0
        }
    }
    
    init(shapes: (String, String)) {
        self.id = UUID()
        self.opponentShape = OpponentShape(rawValue: shapes.0) ?? .ROCK
        self.playerShape = PlayerShape(rawValue: shapes.1) ?? .ROCK
        self.outcomeV2 = StrategyOutcome(rawValue: shapes.1) ?? .LOSE
    }
}
