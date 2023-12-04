//
//  ProfileViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 4.12.2023.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let user: User
    private let service = TweetService()
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets(){
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
}
