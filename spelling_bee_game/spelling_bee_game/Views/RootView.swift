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
                
//                Spacer().frame(maxWidth: .infinity, minHeight: 10, maxHeight: 10).background(Color(Constants.BackgroundColorName.bkColor))
//               Spacer().frame(maxWidth: .infinity, minHeight: 10, maxHeight: 10)
                GameTitleView()
                
                CurrentScoreView(score: score)
                
                Spacer().frame(maxWidth: .infinity, maxHeight: 100)
                
                FoundWordsView(foundWords: foundWords)
                
                CurrentLettersView(currentLetters: currentLetters)
                
                
            }
        }
    }
}

#Preview {
    RootView()
}
