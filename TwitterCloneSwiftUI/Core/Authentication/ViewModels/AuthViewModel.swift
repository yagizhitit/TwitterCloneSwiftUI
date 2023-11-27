//
//  AuthViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 27.11.2023.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    func login(withEmail email: String, password: String){
            print("DEBUG: Did log user in..")
        }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
            print("DEBUG: Did upload user data...")
        }
    
    func signOut(){
        
    }
}
