//
//  CellView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

enum CellState {
    case empty
    case cross
    case circle
    case tie
}

struct GameCellView: View {
    @State var state: CellState
    
    var body: some View {
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
                Image(systemName: "multiply")
                    .font(.system(size: 50))
                    .foregroundColor(.red)
            case .circle:
                Image(systemName: "circle")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
            default:
                EmptyView()
            }
        }
    }
}

