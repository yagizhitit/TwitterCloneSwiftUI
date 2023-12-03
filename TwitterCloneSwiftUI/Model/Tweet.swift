//
//  Tweet.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 3.12.2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
