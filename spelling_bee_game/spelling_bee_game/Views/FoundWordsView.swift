//
//  FoundWordsView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct FoundWordsView: View {
    var foundWords: [String]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .center, spacing: 5) {
                    
                    ForEach(foundWords, id: \.self) { word in
                        Text(word)
                            .bold()
                            .padding(.leading)
                    }
                }
            }
            .frame(width: .infinity, height: 150)
            .border(Color.black, width: 2)
            .background(Color(Constants.FoundWordsBackgroundColorName.bkColor))
        }
    }
}

#Preview {
    FoundWordsView(foundWords: ["pants", "span", "stat"])
}
