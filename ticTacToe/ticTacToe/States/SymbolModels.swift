//
//  SymbolModels.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

enum SymbolModels: String {
    case grid = "square.grid.3x3"
    case filledGrid = "square.grid.3x3.fill"
    case leftArrow = "chevron.left"
    case multyply = "multiply"
    case circle = "circle"
    
    var image: Image {
        Image(systemName: self.rawValue)
    }
}
