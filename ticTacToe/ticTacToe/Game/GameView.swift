//
//  GameView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct GameView: View {
    @State private var cells: [CellState] = Array(repeating: .empty, count: 9)
    
    let gameState: GameState
    
    @ViewBuilder
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            ForEach(0..<3) { rowIndex in
                let startIndex = rowIndex * 3
                let endIndex = startIndex + 3
                let rowCells = Array(cells[startIndex..<endIndex])
                GameRowView(cells: rowCells, updateCell: { index in
                    
                })
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameState: .bot)
    }
}

