//
//  ProfilePhotoSelectorView.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 28.11.2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button{
                showImagePicker.toggle()
            }label: {
                Image("add_photo")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .padding(.top, 44)
            }
            .sheet(isPresented: $showImagePicker){
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
