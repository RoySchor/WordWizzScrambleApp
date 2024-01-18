//
//  ContentView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/15/24.
//

import SwiftUI

struct ContentView: View {
    var words: [String] = ["pants", "span", "stat"]
    var letters: [String] = ["a", "t", "s", "p", "n"]
    var currentWord: String = "ant"
    var score: Int = 3
    
    var body: some View {
        ZStack {
            Color(Constants.BackgroundColorName.bkColor)
                .ignoresSafeArea()
            
            VStack {
                Text("Solving The Lion Spell")
                    .foregroundColor(.black)
                    .bold()
                    .font(.title)
                    .frame(width: 500, height: 100)
                Spacer()
                
                WordListView(words: words)
                
                
                // Need to add additional stying here
                
                CurrentWordView(currentWord: currentWord)
                
                ScoreView(score: score)
            }
        }
    }
}


#Preview {
    ContentView()
}
