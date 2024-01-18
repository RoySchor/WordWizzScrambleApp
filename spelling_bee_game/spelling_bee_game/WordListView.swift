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
        
//        VStack(alignment: .center){
        VStack{
            
            Text("Found Words:")
                .font(.headline)
                .padding(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .center, spacing: 0) {
                    
                    ForEach(words, id: \.self) { word in
                        Text(word)
                            .padding(.leading)
                    }
                }
            }
        }
        .background(Color(Constants.FoundWordsBackgroundColorName.bkColor))
    }
}
