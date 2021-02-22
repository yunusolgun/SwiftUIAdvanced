//
//  WhatsAppCloneSwiftUIApp.swift
//  WhatsAppCloneSwiftUI
//
//  Created by yunus olgun on 21.02.2021.
//

import SwiftUI
import Firebase

@main
struct WhatsAppCloneSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
