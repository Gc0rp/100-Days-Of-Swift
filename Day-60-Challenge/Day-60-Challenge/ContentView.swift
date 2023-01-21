//
//  ContentView.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [User]()
    var body: some View {
        NavigationView {
        List(results) { user in
            NavigationLink {
                UserView(user: user, showingFriendListScreen: false)
            } label: {
                VStack(alignment: .leading) {
                    Text(user.name).font(.headline)

                    Text(user.company).font(.caption)
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
            
        } catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
