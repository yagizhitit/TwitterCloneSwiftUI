//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by Yağız Hitit on 19.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            //no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                //have a looged in user
                mainInterfaceView
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView{
    
    var mainInterfaceView: some View{
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu{
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -360, y: 0)
                .background(showMenu ? Color.white: Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
                
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}
