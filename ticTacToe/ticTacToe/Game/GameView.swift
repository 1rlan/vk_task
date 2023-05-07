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
    @State private var tabbarText = "First player's turn"
    @State private var currentPlayer: DrawState = .circle
    @StateObject var finishState = FinishObservable()
    @ObservedObject private var field = GameField()
    
    let gameState: GameState
    
    @ViewBuilder
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                ZStack {
                    TabBarButtonView(tapAction: popView)
                    Text(tabbarText).font(.custom("Futura", size: 22))
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
                OverlayView(showOverlay: $showOverlay, textOverlay: $textOverlay).transition(.opacity)
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
            currentPlayer = currentPlayer == .circle ? .cross : .circle
        }
    }

    
    func popView() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameState: .bot)
    }
}
