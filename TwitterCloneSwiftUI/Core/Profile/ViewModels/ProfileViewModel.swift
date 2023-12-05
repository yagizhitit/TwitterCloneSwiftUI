//
//  ProfileViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 4.12.2023.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    let user: User
    private let service = TweetService()
    private let userService = UserService()
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet]{
        switch filter{
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
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
    
    func fetchLikedTweets(){
        guard let uid = user.id else { return }
        
        service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0 ..< tweets.count{
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
