//
//  WordListView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/16/24.
//

import Foundation
import SwiftUI

struct WordListView: View {
    var words: [String]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(words, id: \.self) { word in
                    Text(word)
                        .padding()
                        // Need to add more modifiers for styling especially having it centered at start
                }
            }
        }
    }
}
