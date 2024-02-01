//
//  CurrentWordView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct CurrentLettersView: View {
    @EnvironmentObject var gameManager : GameManager
    var currentLetters: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(currentLetters.enumerated()), id: \.offset) {
                    index, letter in
                    Text(String(letter))
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(shouldHighlightLetter(letter: letter) ? .yellow : .primary)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .padding(.horizontal)
        }
    }
    
    private func shouldHighlightLetter(letter: String) -> Bool {
        gameManager.gameType == .newYorkTimesScramble && letter == gameManager.keyLetter
    }
}

#Preview {
    CurrentLettersView(currentLetters: ["a", "n", "t", "b", "e", "c", "n", "t", "b", "e", "c"])
        .environmentObject(GameManager())
}
