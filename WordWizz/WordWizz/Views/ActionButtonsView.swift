//
//  ActionButtonsView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/22/24.
//

import SwiftUI

struct ActionButtonsView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var showPreferences : Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                gameManager.shuffleLetters()
            } label: {
                Image(systemName: "shuffle")
                    .font(.system(size: 30, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
            
            Spacer()
                .frame(width: 10)
            
            Button {
                showPreferences.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 40, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
            .sheet(isPresented: $showPreferences, content: {
                PreferencesView(showPreferences: $showPreferences)
                    .environmentObject(gameManager)
            })
            
            Spacer()
                .frame(width: 10)
            
            Button {
                
            } label: {
                Image(systemName: "lightbulb.min.badge.exclamationmark.fill")
                    .font(.system(size: 30, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
            
            Spacer()
                .frame(width: 10)
            
            Button {
                gameManager.newGame()
            } label: {
                Image(systemName: "arrow.counterclockwise.circle")
                    .font(.system(size: 40, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
        }
    }
}

#Preview {
    ActionButtonsView(showPreferences: .constant(true))
        .environmentObject(GameManager())
}
