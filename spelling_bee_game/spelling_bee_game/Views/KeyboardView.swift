//
//  KeyboardView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var gameManager : GameManager
        
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                ForEach(gameManager.letters, id: \.self) { letter in LettersButtonView(letter: letter)}
            }
            
            Spacer()
                .frame(height: 20)
            
            HStack(spacing: 10) {
                Button {
                    gameManager.submitWord()
                } label: {
                    Text("Enter")
                        .font(.system(size: 25))
                        .bold()
                        .frame(width: 80, height: 55)
                        .foregroundColor(.primary)
                        .background(gameManager.isWordValid ? Color.green.gradient : Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                        .opacity((gameManager.currentWord.count < 4 || !gameManager.isWordValid) ? 0.6 : 1)
                        .cornerRadius(15)
                }
                .disabled(!gameManager.isWordValid)
                
                Spacer()
                    .frame(width: 45)
                
                Button {
                    gameManager.deleteLastLetter()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 25, weight: .heavy))
                        .bold()
                        .frame(width: 55, height: 55)
                        .foregroundColor(.primary)
                        .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                        .opacity((gameManager.currentWord.count < 1) ? 0.6 : 1)
                        .cornerRadius(15)
                }
                .disabled(gameManager.currentWord.isEmpty)
            }
        }
    }
}

#Preview {
    KeyboardView()
        .environmentObject(GameManager())
}
