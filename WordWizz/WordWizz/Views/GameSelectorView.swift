//
//  GameSelectorView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/31/24.
//

import SwiftUI

struct GameSelectorView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var showGameInfo : Bool
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 25)
            titleOfView(title: "Welcome to Word Wizz")
                .cornerRadius(15)
            Spacer()
                .frame(height: 20)
            
            Text("Choose your game:")
                .font(.system(size: 20, weight: .medium))
            
            Picker("Game Type", selection: $gameManager.gameType) {
                ForEach(GameType.allCases, id: \.self) {
                    gameType in
                    Text(gameType.rawValue)
                        .tag(gameType)
                }
            }
            .pickerStyle(.segmented)
            
            Form {
                Section {
                    if gameManager.gameType == .regularScramble {
                        Text("This is the regular game of scramble.\n\nYou are given a set of letters -- you can choose how many in the settings.\n\nYour goal is to form as many words as possible from the given letters.")
                    } else if gameManager.gameType == .newYorkTimesScramble {
                        Text("This is the New York Times Version of scramble.\n\nYou are given a set of letters -- you can choose how many in the settings.\n\nYour goal is to form as many words as possible from the given letters. However, you must use the middle letter in each word you form. This letter will be highlighted in yellow.")
                    }
                } header: {
                    Text("Game Instructions")
                        .bold()
                }
                
                Section {
                    LabeledContent("3 letters or less", value: "0 points/ not allowed")
                    LabeledContent("4 letters", value: "1 point")
                    LabeledContent("5 letters or more", value: "1 point per letter")
                    LabeledContent("Panagram", value: "10 points + their length")
                    Text("Panagram: A word that uses all the available letters")
                        .bold()
                } header: {
                    Text("Scoring")
                        .bold()
                }
            }
            .frame(height: 600)
            .background(Color(Constants.BackgroundColorName.bkColor).gradient)
            .scrollContentBackground(.hidden)
            
            Button("Ready to Play?") {
                showGameInfo.toggle()
            }
            .font(.system(size: 25))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Constants.BackgroundColorName.bkColor).gradient)
        
        Spacer()
            .frame(height: 15)
    }
    
    private func titleOfView(title: String) -> some View {
        HStack(spacing: 3) {
            Text(" ")
            ForEach(Array(title.enumerated()), id: \.offset) { (_, letter) in
                Text(String(letter))
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 50)
            }
            Text(" ")
        }
        .background(Color(red: 74/253, green: 161/253, blue: 212/253).gradient)
    }
}

#Preview {
    GameSelectorView(showGameInfo: .constant(true))
        .environmentObject(GameManager())
}
