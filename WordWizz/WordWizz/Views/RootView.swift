//
//  RootView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var gameManager : GameManager
    @State private var showPreferences = false
    
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
                
                ActionButtonsView(showPreferences: $showPreferences)
                    .environmentObject(gameManager)
                Spacer()
                    .frame(height: 20)
                
                WhatLanguageView()
                
            }
            if let message = gameManager.message {
                Text(message)
                    .foregroundColor(.red)
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(8)
                    .transition(.opacity)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 6)
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(GameManager())
}
