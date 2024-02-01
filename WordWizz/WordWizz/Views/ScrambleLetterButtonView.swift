//
//  ScrambleLetterButtonView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/31/24.
//

import SwiftUI

struct ScrambleLetterButtonView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var letter: String
    let color: Color = Color(Constants.FoundWordsBackgroundColorName.bkColor)
    
    var body: some View {
        Button {
            gameManager.addLetter(letter: letter)
        } label: {
            Text(letter)
                .font(.system(size: CGFloat(35)))
                .bold()
                .frame(width: 40, height: 55)
                .background(color.gradient)
                .foregroundColor(.primary)
                .cornerRadius(15)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ScrambleLetterButtonView(letter: "a")
        .environmentObject(GameManager())
}
