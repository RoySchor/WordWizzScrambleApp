//
//  GamePreferences.swift
//  WordWizz
//
//  Created by Roy Schor on 1/25/24.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    case english = "English"
    case french = "Français"
    var id : String {self.rawValue}
}

enum ProblemSize: Int, CaseIterable, Identifiable {
    case small = 5
    case medium = 6
    case large = 7
    var id : Int {self.rawValue}
}

enum GameType: String, CaseIterable, Identifiable {
    case regularScramble = "Regular Scramble"
    case newYorkTimesScramble = "New York Times Scramble"
    var id : String {self.rawValue}
}
