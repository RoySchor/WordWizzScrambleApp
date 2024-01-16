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
        Text(currentWord)
            .font(.title)
            // Need to add more modifiers for styling
    }
}
