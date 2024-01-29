//
//  HintsView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/29/24.
//

import SwiftUI

struct HintsView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var showHints : Bool
    @State private var showSpecificHints: Bool = false
    @State private var showAllPossibleWords: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    LabeledContent("Your Letters", value: gameManager.letters.joined(separator: ", "))
                    LabeledContent("Number of Words Found", value: String(gameManager.foundWords.count))
                    LabeledContent("Current Score", value: String(gameManager.score))
                } header: {
                    Text("Your Current Stats")
                        .bold()
                }
                
                Section {
                    LabeledContent("Total Possible Words", value: String(gameManager.possibleWords().count))
                    LabeledContent("Total Possible Points", value: String(gameManager.maxPossiblePoints()))
                    LabeledContent("Number of Possible Panagrams", value: String(gameManager.numPossiblePangrams()))
                } header: {
                    Text("Overall Hints")
                        .bold()
                }
                
                Section {
                    Toggle(isOn: $showSpecificHints) {
                        Text("Show Specific Hints")
                    }
                    if showSpecificHints {
                        specificHintsView()
                    }
                }
                Section {
                    Toggle("Show all Possible Words", isOn: $showAllPossibleWords)
                    if showAllPossibleWords {
                        allPossibleWordsView()
                    }
                }
            }
            .navigationBarTitle("Game Hints")
            .toolbar {
                Button("Close") {
                    showHints.toggle()
                }
            }
        }
    }
    
    @ViewBuilder
    private func specificHintsView() -> some View {
        ForEach(gameManager.letters.sorted(), id: \.self) { letter in
            ForEach(4...gameManager.maxLengthOfWords(), id: \.self) { length in
                let wordCountAtLength = gameManager.wordCountStartingWith(letter: letter, length: length)
                
                if wordCountAtLength > 0 {
                    LabeledContent("Words starting with \(letter) of length \(length)", value: String(wordCountAtLength))
                }
            }
        }
    }
    
    @ViewBuilder
    private func allPossibleWordsView() -> some View {
        ScrollView {
            Text(gameManager.possibleWords().sorted().joined(separator: ", "))
                .padding()
        }
    }

}


#Preview {
    HintsView(showHints: .constant(true))
        .environmentObject(GameManager())
}
