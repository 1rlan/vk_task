//
//  CellView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct GameCellView: View {
    var state: DrawState
    var tapAction: () -> Void
    
    var body: some View {
        Button(action: { tapAction() }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
                switch state {
                case .cross:
                    SymbolModels.multyply.image
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                case .circle:
                    SymbolModels.circle.image
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                default:
                    EmptyView()
                }
            }
        }
    }
}

