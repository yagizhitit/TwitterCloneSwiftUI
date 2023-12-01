//
//  ExploreViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 1.12.2023.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
    }
}
