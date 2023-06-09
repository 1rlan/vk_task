//
//  MenuButtonView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 07.05.2023.
//

import SwiftUI

struct MenuButtonView: View {
    let text: String
    let gameState: GameState

    var body: some View {
        NavigationLink(destination: GameView(gameState: gameState)) {
            Text(text)
        }.buttonStyle(MenuButtonStyle())
    }
}

private struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: screenHeight / 10)
            .font(.custom("Futura", size: 30))
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(screenHeight / 16)
            .overlay(
                RoundedRectangle(cornerRadius: screenHeight / 16)
                    .stroke(Color.black, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(text: "Bot player", gameState: .bot)
    }
}

private let screenHeight = UIScreen.main.bounds.height
