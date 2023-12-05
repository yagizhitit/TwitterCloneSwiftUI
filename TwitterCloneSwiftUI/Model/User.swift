//
//  User.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 30.11.2023.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool{ return Auth.auth().currentUser?.uid == id }
}
