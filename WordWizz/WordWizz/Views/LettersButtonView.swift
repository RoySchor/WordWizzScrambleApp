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
    var color: Color = Color(Constants.FoundWordsBackgroundColorName.bkColor)
    
    var body: some View {
        Button {
            gameManager.addLetter(letter: letter)
        } label: {
            ZStack {
                PolygonShape(sides: numberOfSides(for: gameManager.letters.count))
                    .fill(color.gradient)
                    .frame(width: 65, height: 70)
                
                Text(letter)
                    .font(.system(size: CGFloat(35)))
                    .bold()
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(.plain)
    }
    
    private func numberOfSides(for totalLetters: Int) -> Int {
        switch totalLetters {
        case 5: return 4  // Squares (diamonds)
        case 6: return 5  // Pentagons
        case 7: return 6  // Hexagons
        default: return 4
        }
    }
}

#Preview {
    LettersButtonView(letter: "a")
        .environmentObject(GameManager())
}
