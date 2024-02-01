//
//  ScrambleKeyboardView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/31/24.
//

import SwiftUI

struct ScrambleKeyboardView: View {
    @EnvironmentObject var gameManager : GameManager
    
    let screenWidth = UIScreen.main.bounds.width
    let padding: CGFloat = 30
    let buttonSpacing: CGFloat = 15
    let color: Color = Color(Constants.FoundWordsBackgroundColorName.bkColor)
    
    var body: some View {
        VStack {
            let numberOfLetters = gameManager.letters.count
            let totalSpacing = buttonSpacing * CGFloat(numberOfLetters - 1)
            let availableWidth = screenWidth - padding - totalSpacing
            let buttonWidth = availableWidth / CGFloat(numberOfLetters)
            
            HStack(spacing: buttonSpacing) {
                ForEach(gameManager.letters, id: \.self) { letter in ScrambleLetterButtonView(letter: letter)}
                    .frame(width: buttonWidth)
            }
        }
    }
}

#Preview {
    ScrambleKeyboardView()
        .environmentObject(GameManager())
}
