//
//  RockPaperScissorsView.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/28/22.
//

import SwiftUI

struct RockPaperScissorsView: View {
    @State private var games: Array<RockPaperScissors> = []
    @State private var selectedVersion: StrategyVersion = .versionOne
    
    enum StrategyVersion: String, CaseIterable, Identifiable {
        case versionOne
        case versionTwo
        
        var id: Self { self }
    }
    
    var body: some View {
        VStack {
            Picker("Version", selection: $selectedVersion) {
                ForEach(StrategyVersion.allCases) { version in
                    Text(version.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            
            ScrollView {
                LazyVStack {
                    ForEach(games) { game in
                        HStack {
                            Text(game.opponentShape.rawValue)
                            Text(game.playerShape.rawValue)
                            Spacer()
                            Text("\(selectedVersion == .versionOne ? game.gameScoreV1 : game.gameScoreV2)")
                        }
                    }
                }
            }
            
            HStack {
                Text("Total Score")
                Spacer()
                Text("\(totalScore())")
            }
        }
        .padding()
        .navigationTitle("Rock, Paper, Scissors")
        .onAppear {
            loadStrategy()
        }
    }
    
    func totalScore() -> Int {
        var sum = 0
        games.forEach { game in
            sum += selectedVersion == .versionOne ? game.gameScoreV1 : game.gameScoreV2
        }
        
        return sum
    }
    
    func loadStrategy() {
        games = InputReaderClient.strategyGuide()
    }
}

struct RockPaperScissorsView_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissorsView()
    }
}
