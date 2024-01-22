//
//  RootView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct RootView: View {
    var foundWords: [String] = ["pants", "span", "stat"]
    var letters: [String] = ["a", "t", "s", "p", "n"]
    var currentLetters: [String] = ["a", "n", "t"]
    var score: Int = 3
    
    var body: some View {
        ZStack {
            Color(Constants.BackgroundColorName.bkColor)
                .ignoresSafeArea()
            VStack {
                GameTitleView()
                Spacer()
                    .frame(height: 20)
                CurrentScoreView(score: score)
                Spacer()
                    .frame(height: 100)
                
                FoundWordsView(foundWords: foundWords)
                
                CurrentLettersView(currentLetters: currentLetters)
                Spacer()
                    .frame(height: 20)
                KeyboardView(possibleLetters: letters, letterSize: CGFloat(35))
                Spacer()
                    .frame(height: 60)
                ActionButtons()
                
            }
        }
    }
}

#Preview {
    RootView()
}
