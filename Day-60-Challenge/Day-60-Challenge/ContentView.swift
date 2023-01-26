//
//  ContentView.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State private var results = [User]()
//    @State private var results = [CachedUser]()
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: CachedUser.entity(), sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    @FetchRequest(entity: CachedUser.entity(), sortDescriptors: []) var friends: FetchedResults<CachedFriend>
    

    
    var body: some View {
        NavigationView {
        List(users) { user in
            NavigationLink {
                UserView(user: user, showingFriendListScreen: false)
            } label: {
                VStack(alignment: .leading) {
                    Text(user.wrappedName ?? "Unknown name").font(.headline)

                    Text(user.company ?? "Unknown company").font(.caption)
                }.padding(.all, 5)
            }
        }.task {
            await loadData()
        }
            .navigationTitle("Users")
        }

    }
    

    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                self.results = decodedResponse
            }

            await MainActor.run {addNewUsers(results)}

        } catch {
            print("Invalid Data")
        }
        
    }
    
    func addNewUsers(_ users: [User]) {

        for user in users {
            let newUser = CachedUser(context: moc)

            newUser.id = user.id
            newUser.name = user.name
            newUser.address = user.address
            newUser.about = user.about
            newUser.company = user.company
            newUser.age = Int16(user.age)
            newUser.email = user.email
            newUser.isActive = user.isActive
            newUser.registered = user.registered
            newUser.tags = nil
            
            
            for friend in user.friends {
                let newFriend = CachedFriend(context: moc)
                
                newFriend.id = friend.id
                newFriend.name = friend.name
                newFriend.user = newUser
            }
            
            try? moc.save()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
