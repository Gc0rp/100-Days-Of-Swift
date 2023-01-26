//
//  UserView.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import SwiftUI

struct UserView: View {
//    @State public var user: User
    @State public var user: CachedUser
    @State public var showingFriendListScreen: Bool
    

    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Section {
                    HStack {
                        Circle().frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text(user.wrappedName + ", " + String(user.age)).font(.title)
                            Text(user.wrappedCompany).font(.subheadline)
                        }
                        Spacer()
                    }
                }

                Section {
                    Text(user.wrappedAbout)
                }.padding(.bottom, 20)
                
                Section {
                    Text("Contact").font(.headline)
                    Text(user.wrappedName)
                    Text(user.wrappedAddress)
                }
                
                
                Button("Show Friends") {
                    showingFriendListScreen = true
                }.padding(.top, 20)
                
                Spacer()
            }.padding(.all, 20)
        }.sheet(isPresented: $showingFriendListScreen) {
            FriendListView(friendList: user.friendsArray)
        }
    }
    
    
}
