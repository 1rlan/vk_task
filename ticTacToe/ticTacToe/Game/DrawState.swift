//
//  DrawState.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import Foundation

enum DrawState {
    case empty
    case cross
    case circle
    
    mutating func toggle() {
        if self == .circle {
            self = .cross
        } else if self == .cross {
            self = .circle
        }
    }
}
