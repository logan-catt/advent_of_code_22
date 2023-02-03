import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ElfListView()
                } label: {
                    HStack {
                        Image("elf.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Elves")
                    }
                }
                
                NavigationLink {
                    RockPaperScissorsView()
                } label: {
                    HStack {
                        Image(systemName: "scissors")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                        Text("Rock, Paper, Scissors")
                    }
                }
                
                NavigationLink {
                    RucksackView()
                } label: {
                    HStack {
                        Image(systemName: "backpack")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Rucksack Inventory")
                    }
                }
                
                NavigationLink {
                    CleaningAssignmentsView()
                } label: {
                    HStack {
                        Image(systemName: "washer")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Cleaning Assignments")
                    }
                }
                
                NavigationLink {
                    CrateRearrangementView()
                } label: {
                    HStack {
                        Image(systemName: "shippingbox")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Crate Rearrangement")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
