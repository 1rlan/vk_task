//
//  GameView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

class TabbarState: ObservableObject {
    enum State : String {
        case first = "First player's turn"
        case second = "Second player's turn"
        case bot = "Bot's turn..."
        
        mutating func toggle(gameState: GameState) {
            switch self {
            case .first:
                self = gameState == GameState.bot ? .bot : .second
            case .second:
                self = .first
            case .bot:
                self = .first
            }
        }
    }
    
    @Published var state: State = .first
}

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
            currentPlayer.toggle()
            tabbarState.state.toggle(gameState: gameState)
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
