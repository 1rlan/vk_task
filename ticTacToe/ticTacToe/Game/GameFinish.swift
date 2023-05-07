//
//  GameFinish.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import Foundation

enum GameFinish {
    case firstPlayer
    case secondPlayer
    case bot
    case draw
    
    var overlayText: String {
        switch self {
        case .firstPlayer:
            return "First Player Won"
        case .secondPlayer:
            return "Second Player Won"
        case .bot:
            return "Bot Won"
        case .draw:
            return "It's draw!"
        }
    }
}

class FinishObservable: ObservableObject {
    @Published var selectedOption: GameFinish?
}
