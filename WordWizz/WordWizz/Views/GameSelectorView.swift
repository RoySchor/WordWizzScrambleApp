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
                    VStack(alignment: .leading, spacing: 5) {
                        Text("This is the \(gameManager.gameType.rawValue) game.\n\nYou are given a set of letters")
                        
                        HStack(alignment: .top) {
                            Text("\t•")
                            Text("You can choose how many in the settings.")
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Text("\nYour goal is to form as many words as possible from the given letters.")
                    }
                    if gameManager.gameType == .newYorkTimesScramble {
                        Text("However, you must use the middle letter in each word you form. This letter will be highlighted in yellow.")
                    }
                } header: {
                    Text("Game Instructions")
                        .bold()
                }
                
                Section {
                    LabeledContent("2 letters or less", value: "0 points/ not allowed")
                    LabeledContent("3 or 4 letters", value: "1 point")
                    LabeledContent("5 letters or more", value: "1 point per letter")
                    LabeledContent("Panagram", value: "10 points + their length")
                    Text("Panagram: A word that uses all the available letters")
                        .bold()
                } header: {
                    Text("Scoring")
                        .bold()
                }
            }
            .frame(height: 560)
            .background(Color(Constants.BackgroundColorName.bkColor).gradient)
            .scrollContentBackground(.hidden)
            
            Button("Ready to Play?") {
                showGameInfo.toggle()
            }
            .font(.system(size: 25))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Constants.BackgroundColorName.bkColor).gradient)
    }
    
    private func titleOfView(title: String) -> some View {
        HStack(spacing: 3) {
            Text(" ")
            ForEach(Array(title.enumerated()), id: \.offset) { (_, letter) in
                Text(String(letter))
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 60)
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
