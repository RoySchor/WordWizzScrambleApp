//
//  NYTKeyboardView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct NYTKeyboardView: View {
    @EnvironmentObject var gameManager : GameManager
        
    var body: some View {
        VStack {
            let numberOfLetters = gameManager.letters.count
            
            GeometryReader { geometry in
                let radius = min(geometry.size.width, geometry.size.height) / 5.8
                ZStack {
                    NYTLettersButtonView(letter: gameManager.keyLetter, color: .yellow)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    ForEach(0..<gameManager.lettersWithoutKey.count, id: \.self) { index in
                        let angle = getKeyAngle(numberOfLetters: numberOfLetters, index: index)
                        
                        let xPosition = geometry.size.width / 2 + cos(angle) * radius
                        let yPosition = geometry.size.height / 2 + sin(angle) * radius
                        
                        NYTLettersButtonView(letter: gameManager.lettersWithoutKey[index])
                            .position(x: xPosition, y: yPosition)
                    }
                }
            }
        }
    }
    
    private func getKeyAngle(numberOfLetters: Int, index: Int) -> CGFloat {
        let numerator = 2 * CGFloat.pi
        let denominator = CGFloat(numberOfLetters - 1)
        let angleMultiplier = CGFloat(index - 1)
        let baseAngle = numerator / denominator * angleMultiplier
        
        switch numberOfLetters {
        case 7:
           return baseAngle - .pi
        case 6:
            return baseAngle - .pi / 2
        case 5:
            return baseAngle - .pi / 4
        default:
            return baseAngle - .pi
        }
    }
}

#Preview {
    NYTKeyboardView()
        .environmentObject(GameManager())
}
