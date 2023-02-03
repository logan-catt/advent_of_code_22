import SwiftUI

struct CleaningAssignmentsView: View {
    @State private var cleaningAssignments: Array<CleaningPair> = []
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(cleaningAssignments) { pair in
                        HStack {
                            Text("\(pair.assignOne.startSection)")
                            Text("\(pair.assignOne.endSection)")
                            Spacer()
                            Text("\(pair.assignTwo.startSection)")
                            Text("\(pair.assignTwo.endSection)")
                        }
                        .background {
                            pair.fullyContained ? Color.green : Color.clear
                        }
                        .fontWeight(pair.overlap ? .bold : .regular)
                        .padding()
                    }
                    
                    Spacer()
                }
            }
            
            VStack {
                Text("Total fully contained assignments: \(cleaningAssignments.filter{$0.fullyContained}.count)")
                Text("Total overlapping assignments: \(cleaningAssignments.filter{$0.overlap}.count)")
            }
        }
        .navigationTitle("Cleaning Assignments")
        .onAppear {
            loadCleaningAssignments()
        }
    }
    
    private func loadCleaningAssignments() {
        cleaningAssignments = InputReaderClient.cleaningAssignments()
    }
}

struct CleaningAssignmentsView_Previews: PreviewProvider {    
    static var previews: some View {
        CleaningAssignmentsView()
    }
}
