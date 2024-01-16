//
//  ScoreView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/16/24.
//

import Foundation
import SwiftUI

struct ScoreView: View {
    var score: Int

    var body: some View {
        Text("Score: \(score)")
            .font(.headline)
    }
}
