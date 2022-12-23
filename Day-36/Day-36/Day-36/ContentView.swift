//
//  ContentView.swift
//  Day-36
//
//  Created by Ojas Gupta on 21/12/2022.
//

import SwiftUI

//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}


struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct User: Codable {
    let firstName: String
    let lastName: String
    
}

struct ContentView: View {
    @StateObject var user = User(firstName: "Taylor", lastName: "Swift")
    
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        NavigationView {
            VStack {
//                Text("Your name is \(user.firstName) \(user.lastName)")
//
//                TextField("First Name", text: $user.firstName)
//                TextField("Last name", text:$user.lastName)
                
                
                Button("Show Sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet){
                    SecondView(name: "@twoStraws")
                }
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                }
                
                Button("Save User") {
                    let encoder = JSONEncoder()
                    
                    if let data = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
