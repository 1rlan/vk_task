//
//  MenuTitle.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct MenuTitleView: View {
    var body: some View {
        Text("\(SymbolModels.grid.image) TicTacToe \(SymbolModels.filledGrid.image)")
            .font(.custom("Futura", size: 40))
    }
}

struct MenuTitle_Previews: PreviewProvider {
    static var previews: some View {
        MenuTitleView()
    }
}
