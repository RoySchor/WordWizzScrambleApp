//
//  LettersButtonView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct LettersButtonView: View {
    var letter: String
    var letterSize: CGFloat
    
    var body: some View {
        Button {
            // add functionality of what happens when you
            // you press this will be in view model
        } label: {
            Text(letter)
                .font(.system(size: letterSize))
                .bold()
                .frame(width: 45, height: 55)
                .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                .foregroundColor(.primary)
                .cornerRadius(15)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LettersButtonView(letter: "a", letterSize: CGFloat(35))
}
