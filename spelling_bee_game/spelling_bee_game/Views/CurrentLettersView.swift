//
//  CurrentWordView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct CurrentLettersView: View {
    var currentLetters: [String]
    
    var body: some View {
        HStack(spacing: 55) {
            ForEach(currentLetters, id: \.self) {
                letter in
                Text(String(letter))
                    .font(.largeTitle)
                    .bold()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
//        .background(Color(red: 74/253, green: 161/253, blue: 212/253).gradient)
    }
}

#Preview {
    CurrentLettersView(currentLetters: ["a", "n", "t"])
}
