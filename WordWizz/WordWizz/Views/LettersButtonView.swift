//
//  LettersButtonView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct LettersButtonView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var letter: String
    
    var body: some View {
        Button {
            gameManager.addLetter(letter: letter)
        } label: {
            Text(letter)
                .font(.system(size: CGFloat(35)))
                .bold()
                .frame(width: 40, height: 55)
                .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                .foregroundColor(.primary)
                .cornerRadius(15)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LettersButtonView(letter: "a")
        .environmentObject(GameManager())
}
