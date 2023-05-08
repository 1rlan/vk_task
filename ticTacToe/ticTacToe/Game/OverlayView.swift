//
//  Overlat.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import SwiftUI

struct OverlayView: View {
    init(showOverlay: Binding<Bool>, textOverlay: Binding<String>, popViewAction: @escaping () -> Void, resetFieldAction: @escaping () -> Void) {
        self._showOverlay = showOverlay
        self._textOverlay = textOverlay
        self.popViewAction = popViewAction
        self.resetFieldAction = resetFieldAction
    }
    
    @Binding private var showOverlay: Bool
    @Binding private var textOverlay: String
    
    let popViewAction: () -> Void
    let resetFieldAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(textOverlay)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                HStack {
                    Button(action: {
                        popViewAction()
                        showOverlay = false
                    }) {
                        Text("Go to menu")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        resetFieldAction()
                        showOverlay = false
                    }) {
                        Text("Replay!")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView(showOverlay: .constant(true), textOverlay: .constant("First player won"), popViewAction: {}, resetFieldAction: {})
    }
}
