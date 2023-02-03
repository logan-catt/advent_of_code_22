import Foundation
import SwiftUI

struct CrateRearrangementView: View {
    @StateObject private var stacks: Stacks = Stacks(stacks: [])
    @State private var movementInstructions: Array<MovementInstruction> = []
    
    @State var currentInstruction: MovementInstruction?
    
    var body: some View {
        VStack {
            Text(currentInstruction?.stringRepresentation ?? "")
            
            HStack(alignment: .bottom) {
                ForEach(stacks.stacks) { stack in
                    LazyVStack(alignment: .center) {
                        ForEach(stack.crates) { crate in
                            Text(crate.label)
                        }
                        Text("\(stack.id)")
                    }
                }
            }
            
            Button(action: {
                rearrangeCrates()
            }, label: {
                Text("Rearrange")
            })
        }
        .navigationTitle("Crate Rearrangement")
        .onAppear {
            readCrateRearrangement()
        }
    }
    
    private func readCrateRearrangement() {
        let (stacks, movements) = InputReaderClient.crateRearrangement()
        self.stacks.stacks = stacks
        self.movementInstructions = movements
    }
    
    private func rearrangeCrates() {
        for (_, instruction) in movementInstructions.enumerated() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + (0.5 * Double(i))) {
                currentInstruction = instruction
                
                let removedCrates = stacks.stacks[instruction.startStack-1].removeCrates(instruction.numberToMove)
                stacks.stacks[instruction.endStack-1].addCrates(removedCrates)
//            }
        }
    }
}

struct CrateRearrangementView_Previews: PreviewProvider {
    static var previews: some View {
        CrateRearrangementView()
    }
}
