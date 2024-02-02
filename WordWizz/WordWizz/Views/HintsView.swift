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
                    LabeledContent("Your Letters", value: gameManager.letters.sorted().joined(separator: ", "))
                    LabeledContent("Number of Words Found", value: String(gameManager.foundWords.count))
                    LabeledContent("Current Score", value: String(gameManager.score))
                } header: {
                    Text("Your Current Stats")
                        .bold()
                }
                
                Section {
                    LabeledContent("Total Possible Words", value: String(gameManager.listPossibleWords.count))
                    LabeledContent("Total Possible Points", value: String(gameManager.maxPossibleScore))
                    LabeledContent("Number of Possible Panagrams", value: String(gameManager.numPangrams))
                } header: {
                    Text("Overall Hints")
                        .bold()
                }
                
                Section {
                    Toggle(isOn: $showSpecificHints) {
                        Text("Show Specific Hints")
                    }
                    if showSpecificHints {
                        Text("Hint:\nThe number of words that can be formed starting with the given letter at the given length.\n\nInitial Letter, possible word length:")
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
                .font(.system(size: 20))
            }
        }
    }
    
    @ViewBuilder
    private func specificHintsView() -> some View {
        ForEach(gameManager.letters.sorted(), id: \.self) { letter in
            ForEach(3...gameManager.maxLength, id: \.self) { length in
                let wordCountAtLength = gameManager.wordCountStartingWith(letter: letter, length: length)
                
                if wordCountAtLength > 0 {
                    LabeledContent("**\"\(letter.capitalized)\"**, \(length) charcters", value: "\(String(wordCountAtLength)) possibilities")
                }
            }
        }
    }
    
    @ViewBuilder
    private func allPossibleWordsView() -> some View {
        ScrollView {
            let categorizedWords = Dictionary(grouping: gameManager.listPossibleWords.sorted(), by: { $0.count })
            
            ForEach(Array(categorizedWords.keys).sorted(), id: \.self) { length in
                if let words = categorizedWords[length] {
                    VStack {
                        Text("\(length)-letter words")
                            .font(.headline)
                            .padding(.top)
                        Text(words.joined(separator: ", "))
                            .padding(.bottom)
                    }
                }
            }
        }
    }

}


#Preview {
    HintsView(showHints: .constant(true))
        .environmentObject(GameManager())
}
