//
//  UserStatsView.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 27.11.2023.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
            }
            
            HStack(spacing: 4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    UserStatsView()
}

