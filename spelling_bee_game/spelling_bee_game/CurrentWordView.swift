//
//  CurrentWordView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/16/24.
//

import Foundation
import SwiftUI

struct CurrentWordView: View {
    var currentWord: String

    var body: some View {
        HStack(spacing: 15) {
            ForEach(currentWord.map { String($0) }, id: \.self) { letter in
                Text(letter)
                    .font(.title)
                    .bold()
            }
        }
    }
}
