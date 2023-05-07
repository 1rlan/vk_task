//
//  GameRowView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct GameRowView: View {
    let cells: [CellState]
    let updateCell: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(cells.indices, id: \.self) { index in
                Button(action: {
                    updateCell(index)
                }) {
                    GameCellView(state: cells[index])
                }
            }
        }
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(cells: [.circle, .cross, .empty], updateCell: { print($0) })
    }
}


