//
//  CurrentWordView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct CurrentLettersView: View {
    var currentLetters: [String]
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let totalButtonWidth = CGFloat(currentLetters.count) * 45
        let extraPadding: CGFloat = 20 // Adjust this value as needed
        let availableSpacingWidth = screenWidth - totalButtonWidth - extraPadding
        let spacing = max(availableSpacingWidth / CGFloat(currentLetters.count - 1), 0)
        
        HStack(spacing: spacing) {
            ForEach(Array(currentLetters.enumerated()), id: \.offset) {
                index, letter in
                Text(String(letter))
                    .font(.largeTitle)
                    .bold()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
}

#Preview {
    CurrentLettersView(currentLetters: ["a", "n", "t"])
}
