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
        Text(displayLanguageText())
            .bold()
            .font(.title3)
    }
    
    private func displayLanguageText() -> String {
        switch gameManager.language {
        case .english:
            return "Current Language - \(gameManager.language.rawValue)"
        case .french:
            return "Langue Actuelle - \(gameManager.language.rawValue)"
        }
    }
}

#Preview {
    WhatLanguageView()
        .environmentObject(GameManager())
}
