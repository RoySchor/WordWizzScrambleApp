//
//  FoundWordsView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct FoundWordsView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View {
//        VStack{
//            ScrollView(.horizontal, showsIndicators: false) {
//                
//                HStack(alignment: .center, spacing: 15) {
//                    
//                    ForEach(gameManager.foundWords, id: \.self) { word in
//                        Text(word)
//                            .font(.system(size: CGFloat(35)))
//                            .bold()
//                            .padding(.leading)
//                    }
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: 150)
//            .border(Color.black, width: 2)
//            .background(Color(Constants.FoundWordsBackgroundColorName.bkColor))
//        }
        VStack{
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 15) {
                        ForEach(gameManager.foundWords, id: \.self) { word in
                            Text(word)
                                .font(.system(size: CGFloat(35)))
                                .bold()
                                .padding(.leading)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .border(Color.black, width: 2)
                .background(Color(Constants.FoundWordsBackgroundColorName.bkColor))
                .onChange(of: gameManager.foundWords) { _, _ in
                    if let lastWord = gameManager.foundWords.last {
                        withAnimation {
                            proxy.scrollTo(lastWord, anchor: .trailing)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FoundWordsView()
        .environmentObject(GameManager())
}
