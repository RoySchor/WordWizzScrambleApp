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
    @Published var keyLetter: String = ""
    @Published var lettersWithoutKey: [String] = []
    
    @Published var wordsList: [String] = []
    @Published var listPossibleWords: [String] = []
    @Published var maxPossibleScore: Int = 0
    @Published var numPangrams: Int = 0
    @Published var maxLength: Int = 0
    
//    private var possibleWordsCache: [String] = []
    private var wordAttributesCache: [String: (score: Int, isPangram: Bool)] = [:]
    
    @Published var language: Language = .english {
        didSet {
            setLanguage()
            newGame()
        }
    }
    @Published var problemSize: ProblemSize = .medium {
        didSet {
            newGame()
        }
    }
    @Published var gameType: GameType = .regularScramble {
        didSet {
            newGame()
        }
    }
    
    init() {
        setLanguage()
        generateNewLetters()
        setPossibleWords()
        setMaxPossiblePoints()
        setNumPossiblePangrams()
        setMaxLengthOfWords()
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
        switch gameType {
        case .regularScramble:
            letters.shuffle()
        case .newYorkTimesScramble:
            lettersWithoutKey.shuffle()
        }
    }

//    generates new letters
//    Resets the score, current word and found words
    func newGame() {
        generateNewLetters()
        setPossibleWords()
        setMaxPossiblePoints()
        setNumPossiblePangrams()
        setMaxLengthOfWords()
        currentWord = []
        foundWords = []
        score = 0
    }
        
    func possibleWords() -> [String] {
        let setOfLetters = Set(letters.joined())

        var preFilteredWords: [String]
        if gameType == .newYorkTimesScramble {
            preFilteredWords = wordsList.filter { word in
                word.contains(keyLetter)
            }
        } else {
            preFilteredWords = wordsList
        }
        
        return preFilteredWords.filter { word in
            let wordLetters = Set(word)
            
            if !wordLetters.isSubset(of: setOfLetters) {
                return false
            }
            return word.count >= 4
        }
    }
    
    func maxPossiblePoints() -> Int {
//        let possibleWords = possibleWords()
        return listPossibleWords.reduce(0) { total, word in
            total + scoreForWord(word: Array(word.map { String($0) }))
        }
    }
    
    func numPossiblePangrams() -> Int {
        return listPossibleWords.filter { isPangram(word: Array($0.map { String($0) })) }.count
//        return possibleWords().filter { isPangram(word: Array($0.map { String($0) })) }.count
    }
    
    func wordCountStartingWith(letter: String, length: Int) -> Int {
        return listPossibleWords.filter { $0.hasPrefix(letter) && $0.count == length }.count
//        return possibleWords().filter { $0.hasPrefix(letter) && $0.count == length }.count
    }
    
    func maxLengthOfWords() -> Int {
        return listPossibleWords.map { $0.count }.max()!
//        return possibleWords().map { $0.count }.max()!
    }
    
    private func setPossibleWords() {
        listPossibleWords = possibleWords()
        
//        possibleWordsCache = possibleWords()
    }
    
    private func setMaxPossiblePoints() {
        maxPossibleScore = maxPossiblePoints()
    }
    
    private func setNumPossiblePangrams() {
        numPangrams = numPossiblePangrams()
    }
    
    private func setMaxLengthOfWords() {
        maxLength = maxLengthOfWords()
    }
    
    private func generateNewLetters() {
//        setLanguage()
        
        let uniqueCharCount = setGameSize()
        
//        Filters the words list to those words of unique chars
        let filteredWords = wordsList.filter { Set($0).count == uniqueCharCount }
        
//        selects a random element and grabs its unique chars
        let uniqueCharacters = Set(filteredWords.randomElement()!)
        letters = uniqueCharacters.map { String($0) }
        keyLetter = letters.first!
        lettersWithoutKey = letters
        lettersWithoutKey.remove(at: lettersWithoutKey.firstIndex(of: keyLetter)!)
    }
    
    private func setLanguage() {
        //        Switches to correct language
        switch language {
        case .english:
            let wordsFilePath = Bundle.main.path(forResource: "AllEnglishWords", ofType: "json")!
            let wordsData = FileManager.default.contents(atPath: wordsFilePath)!
            let json = try! JSONSerialization.jsonObject(with: wordsData, options: []) as! [String: [String]]
            wordsList = json["words"]!
        case .french:
            let wordsFilePath = Bundle.main.path(forResource: "AllFrenchWords", ofType: "json")!
            let wordsData = FileManager.default.contents(atPath: wordsFilePath)!
            let json = try! JSONSerialization.jsonObject(with: wordsData, options: []) as! [String: [String]]
            wordsList = json["words"]!
        }
    }
    
    private func setGameSize() -> Int {
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
        
        return uniqueCharCount
    }

    private func updateWordValidity() {
        if currentWord.count >= 4 {
            switch gameType {
            case .regularScramble, .newYorkTimesScramble:
                if gameType == .newYorkTimesScramble && !currentWord.contains(keyLetter) {
                    isWordValid = false
                    return
                }
                
                var segmentedWordList = [String]()
                if language == .english {
//                    segmentedWordList = English\(currentWord.count)Letters.words
                    segmentedWordList = WordLists.englishWordsByCount[currentWord.count]!
                } else if language == .french {
//                    segmentedWordList = french_words_\(currentWord.count)_letters.words
                    segmentedWordList = WordLists.frenchWordsByCount[currentWord.count]!

                }
                
                isWordValid = segmentedWordList.contains(currentWord.joined())
            }
        } else {
            isWordValid = false
        }
    }
    
    private func updateWordValidity2() {
        switch gameType {
        case .regularScramble:
            if currentWord.count >= 4 && wordsList.contains(currentWord.joined()) {
                isWordValid = true
            } else {
                isWordValid = false
            }
        case .newYorkTimesScramble:
            if currentWord.count >= 4 && currentWord.contains(keyLetter) && wordsList.contains(currentWord.joined()) {
                isWordValid = true
            } else {
                isWordValid = false
            }
        }
    }

    private func updateScore() {
        score += scoreForWord(word: currentWord)
    }
    
    //    words score points equal to their length
    private func scoreForWord(word: [String]) -> Int {
        var currentWordScore = 0
        
        //    A four-letter word scores one point
        if word.count == 4 {
            currentWordScore += 1
        } else {
            //    A pangram scores an additional 10 points
            if isPangram(word: word){
                currentWordScore += 10
            }
            currentWordScore += word.count
        }
        return currentWordScore
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
    
    private struct WordLists {
        static let englishWordsByCount: [Int: [String]] = [
            3: English3Letters.words,
            4: English4Letters.words,
            5: English5Letters.words,
            6: English6Letters.words,
            7: English7Letters.words,
            8: English8Letters.words,
            9: English9Letters.words,
            10: English10Letters.words,
            11: English11Letters.words,
            12: English12Letters.words,
            13: English13Letters.words,
            14: English14Letters.words,
            15: English15Letters.words,
            16: English16Letters.words,
            17: English17Letters.words,
            18: English18Letters.words,
            19: English19Letters.words,
            20: English20Letters.words
        ]

        static let frenchWordsByCount: [Int: [String]] = [
            3: french_words_3_letters.words,
            4: french_words_4_letters.words,
            5: french_words_5_letters.words,
            6: french_words_6_letters.words,
            7: french_words_7_letters.words,
            8: french_words_8_letters.words,
            9: french_words_9_letters.words,
            10: french_words_10_letters.words,
            11: french_words_11_letters.words,
            12: french_words_12_letters.words,
            13: french_words_13_letters.words,
            14: french_words_14_letters.words,
            15: french_words_15_letters.words,
            16: french_words_16_letters.words,
            17: french_words_17_letters.words
        ]
    }
}
