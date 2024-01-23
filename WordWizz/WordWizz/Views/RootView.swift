//
//  RootView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View {
        ZStack {
            Color(Constants.BackgroundColorName.bkColor)
                .ignoresSafeArea()
            VStack {
                GameTitleView()
                Spacer()
                    .frame(height: 20)
                
                CurrentScoreView()
                Spacer()
                    .frame(height: 100)
                
                FoundWordsView()
                
                CurrentLettersView(currentLetters: gameManager.currentWord)
                Spacer()
                    .frame(height: 20)
                
                KeyboardView()
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
