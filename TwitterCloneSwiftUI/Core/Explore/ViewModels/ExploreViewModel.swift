//
//  ExploreViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 1.12.2023.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var searchText = ""
    
    //MARK: Filtering users in ExploreView !!
    var searchableUsers: [User]{
        if searchText.isEmpty{
            return users
        } else{
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
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
