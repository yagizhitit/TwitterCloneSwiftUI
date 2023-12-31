//
//  TweetRowView.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 19.11.2023.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            //profile image + user info + tweet
            if let user = viewModel.tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(.systemBlue))
                    
                    //User info & tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        //User info
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                
                        //tweet caption
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    
                }
            }
            // action buttons
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                }, label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                })
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

//#Preview {
//    TweetRowView()
//}
