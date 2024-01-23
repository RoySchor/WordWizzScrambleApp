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
        HStack(spacing: 30) {
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
