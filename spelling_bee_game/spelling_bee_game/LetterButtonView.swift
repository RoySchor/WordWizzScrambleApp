//
//  LetterButtonView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/16/24.
//

import Foundation
import SwiftUI

struct LetterButtonView: View {
    var letters: [String]
    var onLetterTap: (String) -> Void

    var body: some View {
        HStack {
            ForEach(letters, id: \.self) { letter in
                Button(letter) {
                    onLetterTap(letter)
                }
                // Need to add more modifiers for styling
            }
        }
    }
}
