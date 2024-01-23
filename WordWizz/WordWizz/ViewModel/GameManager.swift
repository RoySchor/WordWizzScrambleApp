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
//        if word is valid and wasn't already found then submit it
        if isWordValid && !foundWords.contains(currentWord) {
            foundWords.append(currentWord.joined())
            updateScore()
            currentWord = []
            isWordValid = false
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
    
    private func generateNewLetters() {
//        Filters the words list to those words of 5 unique chars
        let filteredWords = Words.words.filter { Set($0).count == 5 }
//        selects a random element and grabs its unique chars
        let uniqueCharacters = Set(filteredWords.randomElement()!)
        letters = uniqueCharacters.map { String($0) }
    }

    private func updateWordValidity() {
        if currentWord.count >= 4 && Words.words.contains(currentWord.joined()) {
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
}
