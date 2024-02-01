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
    var gameType: GameType
}

struct ScrambleGame {
    var preferences: GamePreferences
    var letters: [String]
    var foundWords: [String]
    var currentWord: [String]
    var score: Int
    
    init(preferences: GamePreferences, letters: [String]) {
        self.preferences = preferences
        self.letters = letters
        self.foundWords = []
        self.currentWord = []
        self.score = 0
    }
}
