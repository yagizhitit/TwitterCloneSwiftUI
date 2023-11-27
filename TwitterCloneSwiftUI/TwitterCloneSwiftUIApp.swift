//
//  TwitterCloneSwiftUIApp.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 19.11.2023.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUICloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
