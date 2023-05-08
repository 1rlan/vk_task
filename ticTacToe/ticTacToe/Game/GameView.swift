//
//  GameView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showOverlay = false
    @State private var textOverlay = ""
    @State private var currentPlayer: DrawState = .circle
    
    @StateObject var tabbarState = TabbarState()
    @StateObject var finishState = FinishObservable()
    @ObservedObject private var field = GameField()
    
    let gameState: GameState
    
    @ViewBuilder
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                ZStack {
                    TabBarButtonView(tapAction: popView)
                    Text(tabbarState.state.rawValue).font(.custom("Futura", size: 22))
                }
                Spacer()
                ForEach(0..<3) { rowIndex in
                    HStack(spacing: 16) {
                        ForEach(0..<3) { columnIndex in
                            let index = rowIndex * 3 + columnIndex
                            GameCellView(state: field.cells[index]) {
                                updateCell(index)
                            }
                        }
                    }
                }
                Spacer()
            }.padding(.horizontal, 16)
            if showOverlay {
                OverlayView(showOverlay: $showOverlay,
                            textOverlay: $textOverlay,
                            popViewAction: popView,
                            resetFieldAction: resetFiled)
                    
                    .transition(.opacity)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onReceive(finishState.$selectedOption) { option in
            if let state = option {
                textOverlay = state.overlayText
                showOverlay = true
            }
        }
    }
    

    private func updateCell(_ index: Int) {
        if field.cells[index] == .empty {
            field.cells[index] = currentPlayer
            currentPlayer.toggle()

            if !checkForWinner() {
                tabbarState.state.toggle(gameState: gameState)
                
                if (gameState == .bot && tabbarState.state == .bot) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        updateCell(findRandomIndex(in: field.cells, matching: .empty) ?? 0)
                    }
                }
            } else {
                tabbarState.state.toggle(gameState: gameState)
            }
        }
    }

    
    private func checkForWinner() -> Bool {
        let winningPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]

        for pattern in winningPatterns {
            let cell1 = field.cells[pattern[0]]
            let cell2 = field.cells[pattern[1]]
            let cell3 = field.cells[pattern[2]]
            
            if cell1 != .empty && cell1 == cell2 && cell2 == cell3 {
                switch tabbarState.state {
                case .bot:
                    finishState.selectedOption = .bot
                case .first:
                    finishState.selectedOption = .firstPlayer
                case .second:
                    finishState.selectedOption = .secondPlayer
                }
                
                return true
            }
        }
            
        var isDraw = true
        field.cells.forEach { cell in
            if cell == .empty {
                isDraw = false
                return
            }
        }
        
        if (isDraw) {
            finishState.selectedOption = .draw
            return true
        }
        
        return false
    }

    func resetFiled() {
        currentPlayer = .circle
        tabbarState.state = .first
        field.resetCells()
    }
    
    func popView() {
        resetFiled()
        presentationMode.wrappedValue.dismiss()
    }
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameState: .bot)
    }
}
