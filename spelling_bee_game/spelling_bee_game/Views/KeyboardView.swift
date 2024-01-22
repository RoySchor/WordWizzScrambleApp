//
//  KeyboardView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct KeyboardView: View {
    var possibleLetters: [String]
    var letterSize: CGFloat
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                ForEach(possibleLetters, id: \.self) { letter in LettersButtonView(letter: letter, letterSize: letterSize)}
            }
            
            Spacer()
                .frame(height: 20)
            
            HStack(spacing: 10) {
                Button {
                    
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 25))
                .bold()
                .frame(width: 80, height: 55)
                .foregroundColor(.primary)
                .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                .cornerRadius(15)
                Spacer()
                    .frame(width: 45)
                Button {
                    
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 25, weight: .heavy))
                        .bold()
                        .frame(width: 55, height: 55)
                        .foregroundColor(.primary)
                        .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                        .cornerRadius(15)
                }
            }
        }
    }
}

#Preview {
    KeyboardView(possibleLetters: ["a", "t", "s", "p", "n"], letterSize: CGFloat(35))
}
