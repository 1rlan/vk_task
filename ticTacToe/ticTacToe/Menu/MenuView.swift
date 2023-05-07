//
//  MenuView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(spacing: 10) {
            MenuTitleView().padding(.top, 40)
            Spacer()
            MenuButtonView(text: "With Bot", tapAction: {} )
            MenuButtonView(text: "With player", tapAction: {})
        }.padding(.horizontal, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
