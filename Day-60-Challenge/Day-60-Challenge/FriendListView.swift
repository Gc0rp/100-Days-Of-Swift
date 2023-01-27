//
//  FriendListView.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import SwiftUI

struct FriendListView: View {
    @State public var friendList: [CachedFriend]
    @Environment(\.dismiss) var dismiss
    

    var body: some View {

        NavigationView {
            List(friendList) { friend in
                    VStack(alignment: .leading) {
                        Text(friend.wrappedName).font(.headline)
                    }.padding(.all, 5)
            }
            .toolbar {
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}
