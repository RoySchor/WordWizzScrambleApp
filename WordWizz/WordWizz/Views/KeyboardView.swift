//
//  KeyboardView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var gameManager : GameManager
        
    var body: some View {
        VStack {
            let numberOfLetters = gameManager.letters.count
            
            GeometryReader { geometry in
                let radius = min(geometry.size.width, geometry.size.height) / 5.8
                ZStack {
                    LettersButtonView(letter: gameManager.letters.first!)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    ForEach(1..<numberOfLetters, id: \.self) { index in
                        let angle = getKeyAngle(numberOfLetters: numberOfLetters, index: index)
                        
                        let xPosition = geometry.size.width / 2 + cos(angle) * radius
                        let yPosition = geometry.size.height / 2 + sin(angle) * radius
                        
                        LettersButtonView(letter: gameManager.letters[index])
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
    KeyboardView()
        .environmentObject(GameManager())
}
