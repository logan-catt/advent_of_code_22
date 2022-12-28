//
//  ElfCellView.swift
//  AdventOfCode22
//
//  Created by Logan Parmeter on 12/10/22.
//

import SwiftUI

struct ElfCellView: View {
    var elf: Elf
    var body: some View {
        HStack {
            Image("elf.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Elf \(elf.id)")
            Spacer()
        }
    }
}

struct ElfCellView_Previews: PreviewProvider {
    static var sampleElf: Elf = .init(id: 1, food: [])
    static var previews: some View {
        ElfCellView(elf: sampleElf)
    }
}
