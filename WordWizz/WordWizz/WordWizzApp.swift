//
//  WordWizzApp.swift
//  WordWizz
//
//  Created by Roy Schor on 1/15/24.
//

import SwiftUI

@main
struct WordWizzApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(GameManager())
        }
    }
}
