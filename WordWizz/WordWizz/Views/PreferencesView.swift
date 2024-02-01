//
//  PreferencesView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/25/24.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var showPreferences : Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Language for guessing", selection: $gameManager.language) {
                        ForEach(Language.allCases, id: \.self) { language in
                            Text(language.rawValue)
                                .tag(language)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Language of the Game")
                        .bold()
                }
                
                Section {
                    Picker("Choose the amount of letters", selection: $gameManager.problemSize) {
                        ForEach(ProblemSize.allCases, id: \.self) { size in
                            Text("\(size.rawValue) letters")
                                .tag(size)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Difficulty of Game")
                        .bold()
                }
                
            }
            .navigationBarTitle("Game Preferences")
            .toolbar {
                Button("Close") {
                    showPreferences.toggle()
                }
                .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    PreferencesView(showPreferences: .constant(true))
        .environmentObject(GameManager())
}
