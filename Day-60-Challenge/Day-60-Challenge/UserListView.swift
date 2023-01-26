//
//  UserListView.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import SwiftUI

struct UserListView: View {
    @State public var userList: [CachedUser]
    var body: some View {
        List(userList) { user in
            NavigationLink {
                UserView(user: user, showingFriendListScreen: false)
            } label: {
                VStack(alignment: .leading) {
                    Text(user.wrappedName).font(.headline)

                    Text(user.wrappedCompany).font(.caption)
                }.padding(.all, 5)
            }

        }
//        Text(userList[0].address)
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView(userList: [])
//    }
//}
