//
//  VernostTaskApp.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//

import SwiftUI

@main
struct VernostTaskApp: App {
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoggedIn {
                    NavigationStack {
                        ListingView()
                    }
                } else {
                    LoginView(isLoggedIn: $isLoggedIn)
                }
            }
            .preferredColorScheme(.light)
        }
    }
}
