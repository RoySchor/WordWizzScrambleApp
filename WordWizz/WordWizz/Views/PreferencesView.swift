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
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("Choose a language", selection: $gameManager.language) {
                    ForEach(Language.allCases, id: \.self) { language in
                        Text(language.rawValue)
                            .tag(language)
                    }
                }
                
                Picker("Choose the amount of letters", selection: $gameManager.problemSize) {
                    ForEach(ProblemSize.allCases, id: \.self) { size in
                        Text("\(size.rawValue)")
                            .tag(size)
                    }
                }
            }
            .navigationBarTitle("Game Preferences")
        }
//        NavigationView {
//            Form {
//                Picker("Choose a language", selection: $language) {
//                    ForEach(Language.allCases, id: \.self) { language in
//                        Text(language.rawValue)
//                            .tag(language)
//                    }
//                }
//                
//                Picker("Choose the amount of letters", selection: $problemSize) {
//                    ForEach(ProblemSize.allCases, id: \.self) { size in
//                        Text("\(size.rawValue)")
//                            .tag(size)
//                    }
//                }
//            }
//            .navigationBarTitle("Game Preferences")
//        }
    }
}
//
//#Preview {
//    PreferencesView()
//}
