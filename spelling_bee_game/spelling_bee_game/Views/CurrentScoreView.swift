//
//  CurrentScoreView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct CurrentScoreView: View {
    var score: Int
    
    var body: some View {
        Text("Score: \(score)")
            .bold()
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: 20)
    }
}

#Preview {
    CurrentScoreView(score: 5)
}
