//
//  MenuView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                MenuTitleView().padding(.top, 10)
                Spacer()
                MenuButtonView(text: "With Bot", gameState: .bot)
                MenuButtonView(text: "With player", gameState: .player)
            }.padding(.horizontal, 16)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
