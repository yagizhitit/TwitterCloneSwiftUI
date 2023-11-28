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
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(ProfileImagemodifier())
                        .clipShape(Circle())
                } else {
                    Image("add_photo")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImagemodifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage{
                Button{
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImagemodifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 250, height: 250)
    }
}

#Preview {
    ProfilePhotoSelectorView()
}

