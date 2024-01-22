//
//  RootView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var gameManager : GameManager
    
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
//                CurrentScoreView(score: score)
                CurrentScoreView()
                Spacer()
                    .frame(height: 100)
                
//                FoundWordsView(foundWords: foundWords)
                FoundWordsView()
                
//                CurrentLettersView(currentLetters: currentLetters)
                CurrentLettersView(currentLetters: gameManager.currentWord)
                
                Spacer()
                    .frame(height: 20)
                
//                KeyboardView(possibleLetters: letters, letterSize: CGFloat(35))
                KeyboardView(letterSize: CGFloat(35))
                
                Spacer()
                    .frame(height: 60)
                
                ActionButtonsView()
                
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(GameManager())
}
