//
//  TabBarButtonView.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import SwiftUI

struct TabBarButtonView: View {
    let tapAction: () -> Void
    
    var body: some View {
        Button(action: {
            tapAction()
        }) {
            SymbolModels.leftArrow.image
                .foregroundColor(.black)
                .font(.system(size: 32))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(tapAction: {})
    }
}
