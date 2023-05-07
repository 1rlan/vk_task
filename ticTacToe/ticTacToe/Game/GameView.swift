//
//  GameView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var cells: [CellState] = Array(repeating: .empty, count: 9)
    @State private var showOverlay = false
    @State private var textOverlay = ""
    @State private var tabbarText = "First player's turn"
    @StateObject var finishState = FinishObservable()
    
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
                    let startIndex = rowIndex * 3
                    let endIndex = startIndex + 3
                    let rowCells = Array(cells[startIndex..<endIndex])
                    GameRowView(cells: rowCells, updateCell: { index in
                        
                    })
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
    

    
    
    func popView() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameState: .bot)
    }
}
