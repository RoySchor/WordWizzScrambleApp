//
//  GameTitleView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct GameTitleView: View {
    var body: some View {        
        HStack(spacing: 20) {
            Text(" ")
            ForEach(Array("Lion Spell".enumerated()), id: \.offset) { (offset, letter) in
                Text(String(letter))
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: .infinity, height: 50)
            }
            Text(" ")
        }
        .background(Color(red: 74/253, green: 161/253, blue: 212/253).gradient)
    }
}

#Preview {
    GameTitleView()
}
