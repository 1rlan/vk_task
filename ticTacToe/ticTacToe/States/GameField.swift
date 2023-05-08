//
//  GameField.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import Foundation

class GameField: ObservableObject {
    @Published var cells: [DrawState] = Array(repeating: .empty, count: 9)
    
    func updateCell(at index: Int, with state: DrawState) {
        cells[index] = state
    }
    
    func resetCells() {
        cells = Array(repeating: .empty, count: 9)
    }
}
