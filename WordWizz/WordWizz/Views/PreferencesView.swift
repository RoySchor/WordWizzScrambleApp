//
//  PreferencesView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/25/24.
//

import SwiftUI

struct PreferencesView: View {
//    @Binding var language: Language
//    @Binding var problemSize: ProblemSize
    @EnvironmentObject var gameManager : GameManager
    @Binding var showPreferences : Bool
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("Choose a language for guessing", selection: $gameManager.language) {
                    ForEach(Language.allCases, id: \.self) { language in
                        Text(language.rawValue)
                            .tag(language)
                    }
                }
                
                Picker("Choose the amount of letters", selection: $gameManager.problemSize) {
                    ForEach(ProblemSize.allCases, id: \.self) { size in
                        Text("\(size.rawValue) letters")
                            .tag(size)
                    }
                }
            }
            .navigationBarTitle("Game Preferences")
            .toolbar {
                Button("Close") {
                    showPreferences.toggle()
                }
            }
        }
    }
}

#Preview {
    PreferencesView(showPreferences: .constant(true))
        .environmentObject(GameManager())
}
