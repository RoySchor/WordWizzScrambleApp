//
//  WordScrambling.swift
//  WordWizz
//
//  Created by Roy Schor on 1/22/24.
//

import Foundation

struct GamePreferences {
    var language: Language
    var problemSize: ProblemSize
}

struct ScrambleGame {
    var preferences: GamePreferences
//    var numLetters: Int
    var letters: [String]
    var foundWords: [String]
    var currentWord: [String]
    var score: Int
    
//    init(preferences: GamePreferences, numLetters: Int, letters: [String]) {
    init(preferences: GamePreferences, letters: [String]) {
        self.preferences = preferences
//        self.numLetters = numLetters
        self.letters = letters
        self.foundWords = []
        self.currentWord = []
        self.score = 0
    }
}
