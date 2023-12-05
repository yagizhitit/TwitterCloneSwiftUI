//
//  TweetRowViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 5.12.2023.
//

import Foundation

class TweetRowViewModel: ObservableObject{
    let tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
    
    func likeTweet(){
        service.likeTweet(tweet)
    }
}
