//
//  Overlat.swift
//  ticTacToe
//
//  Created by Ирлан Абушахманов on 08.05.2023.
//

import SwiftUI

struct OverlayView: View {
    init(showOverlay: Binding<Bool>, textOverlay: Binding<String>) {
        self._showOverlay = showOverlay
        self._textOverlay = textOverlay
    }
    
    @Binding private var showOverlay: Bool
    @Binding private var textOverlay: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(textOverlay)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                    showOverlay = false
                }) {
                    Text("Close")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView(showOverlay: .constant(true), textOverlay: .constant("First player won"))
    }
}
