//
//  WordScrambling.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/22/24.
//

import Foundation

//enum

struct ScrambleGame {
    var numLetters: Int
    var letters: [String]
    var foundWords: [String]
    var currentWord: [String]
    var score: Int
    
    init(numLetters: Int, letters: [String]) {
        self.numLetters = numLetters
        self.letters = letters
        self.foundWords = []
        self.currentWord = []
        self.score = 0
    }
}

let testGame = ScrambleGame(numLetters: 5, letters: ["a", "t", "s", "p", "n"])
