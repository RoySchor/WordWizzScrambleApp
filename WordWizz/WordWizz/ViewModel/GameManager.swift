//
//  GameManager.swift
//  WordWizz
//
//  Created by Roy Schor on 1/22/24.
//

import Foundation

class GameManager: ObservableObject {
    @Published var letters: [String] = []
    @Published var currentWord: [String] = []
    @Published var foundWords: [String] = []
    @Published var score: Int = 0
    @Published var isWordValid: Bool = false
    @Published var message: String? = nil

    @Published var language: Language = .english {
        didSet {
            newGame()
        }
    }
    @Published var problemSize: ProblemSize = .medium {
        didSet {
            newGame()
        }
    }
    @Published var wordsList: [String] = EnglishWords.words
    
    init() {
        generateNewLetters()
    }
    
    func addLetter(letter: String) {
        currentWord.append(letter)
        updateWordValidity()
    }
    
    func deleteLastLetter() {
        if !currentWord.isEmpty {
            currentWord.removeLast()
            updateWordValidity()
        }
    }

    func submitWord() {
        let joinedWord = currentWord.joined()
//        if word is valid and wasn't already found then submit it
        if isWordValid {
            if !foundWords.contains(joinedWord) {
                foundWords.append(joinedWord)
                updateScore()
                currentWord = []
                isWordValid = false
                message = nil
            } else {
                showMessage("Word Already Found 😊")
            }
        }
    }
    
    func shuffleLetters() {
        letters.shuffle()
    }

//    generates new letters
//    Resets the score, current word and found words
    func newGame() {
        generateNewLetters()
        currentWord = []
        foundWords = []
        score = 0
    }
    
//    func updateLanguage(newLanguage: Language) {
//        self.language = newLanguage
//    }
//    
//    func updateProblemSize(newSize: ProblemSize) {
//        self.problemSize = newSize
//    }
    
    private func generateNewLetters() {
//        Switches to correct language
        switch language {
        case .english:
            wordsList = EnglishWords.words
        case .french:
            wordsList = FrenchWords.words
        }
        
//        Switches to correct problem size
        let uniqueCharCount: Int
        switch problemSize {
        case .small:
            uniqueCharCount = 5
        case .medium:
            uniqueCharCount = 6
        case .large:
            uniqueCharCount = 7
        }
        
//        Filters the words list to those words of 5 unique chars
        let filteredWords = wordsList.filter { Set($0).count == uniqueCharCount }
        
//        selects a random element and grabs its unique chars
        let uniqueCharacters = Set(filteredWords.randomElement()!)
        letters = uniqueCharacters.map { String($0) }
    }

    private func updateWordValidity() {
//        if currentWord.count >= 4 && Words.words.contains(currentWord.joined()) {
        if currentWord.count >= 4 && wordsList.contains(currentWord.joined()) {
            isWordValid = true
        } else {
            isWordValid = false
        }
    }

//    A four-letter word scores one point
//    A pangram scores an additional 10 points
//    words score points equal to their length
    private func updateScore() {
        if currentWord.count == 4 {
            score += 1
        }
        else {
            if isPangram(word: currentWord){
                score += 10
            }
            score += currentWord.count
        }
    }

//    Check if the word is a pangram, contains all letters
    private func isPangram(word: [String]) -> Bool {
        return Set(word).count == letters.count
    }
    
    private func showMessage(_ message: String, duration: TimeInterval = 2.0) {
        self.message = message
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.message = nil
        }
    }
}
