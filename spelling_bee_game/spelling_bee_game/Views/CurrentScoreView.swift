//
//  CurrentScoreView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct CurrentScoreView: View {
    @EnvironmentObject var gameManager : GameManager
//    var score: Int
    
    var body: some View {
        Text("Score: \(gameManager.score)")
            .bold()
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: 20)
    }
}

#Preview {
    CurrentScoreView()
        .environmentObject(GameManager())
}
