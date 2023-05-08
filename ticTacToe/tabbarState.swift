//
//  tabbarState.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import Foundation

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
