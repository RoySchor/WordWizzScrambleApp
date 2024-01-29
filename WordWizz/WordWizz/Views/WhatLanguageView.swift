//
//  WhatLanguageView.swift
//  WordWizz
//
//  Created by Roy Schor on 1/29/24.
//

import SwiftUI

struct WhatLanguageView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View {
        Text("Current Language - \(gameManager.language.rawValue)")
            .bold()
            .font(.title3)
    }
}

#Preview {
    WhatLanguageView()
        .environmentObject(GameManager())
}
