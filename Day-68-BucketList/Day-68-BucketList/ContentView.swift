//
//  ContentView.swift
//  Day-68-BucketList
//
//  Created by Ojas Gupta on 3/2/2023.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}


struct ContentView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "List")
    ].sorted()
    
    var loadingState = LoadingState.loading
    var fileName = "message"
    
    var body: some View {
//        List(users) { user in
//            Text("\(user.firstName) \(user.lastName)")
//        }
        VStack {
            Text("Hello, World")
                .onTapGesture {
                    let str = "Test Message"
                    let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            
            
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
        }

        
        
//        if LoadingState == .loading {
//            LoadingView()
//        } else if loadingState == .success {
//            SuccessView()
//        } else if loadingState == .failed {
//            FailedView()
//        }
        
        
        Text(readFile("message"))
        
    }
        
    
    func readFile(_ filename: String) -> String {
        var text: String
        var myCounter: Int
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "txt") else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        
        do {
            let contents = try String(contentsOf: file, encoding: String.Encoding.utf8)
            
            let lines = contents.split(separator: "\n")
            
            print("Contents: \(contents)")
            print("Lines : \(lines)")
            
            myCounter = lines.count
            
            text = String(myCounter)
            
        } catch {
            return error.localizedDescription
        }
        
        return text
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
