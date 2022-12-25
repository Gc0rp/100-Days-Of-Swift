//
//  ContentView.swift
//  Moonshot-Day-39
//
//  Created by Ojas Gupta on 25/12/2022.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new customText")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    
    var body: some View {
//        GeometryReader{ geo in
//            Image("Example")
//                .resizable()
//                .scaledToFit()
//                .frame(width: geo.size.width * 0.8)
//                .frame(width: geo.size.width, height: geo.size.height)
//        }
        
        
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                        .padding()
//                }
//                .navigationTitle("SwiftUI")
//            }
//        }
        
        
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 20) {
//                ForEach(0..<100) {
//                    Text("Item \($0)")
//                        .font(.title)
//                }
//            }
//        }

        
//        Button("Decode JSON") {
//            let input = """
//    {
//        "name": "Taylor Swift",
//        "address": {
//            "street" : "555, Taylor Swift Avenue",
//            "city" : "Nashville"
//        }
//    }
//"""
//            let data = Data(input.utf8)
//
//            if let user = try? JSONDecoder().decode(User.self, from: data) {
//                print(user.address.street)
//                Text(user.address.street)
//            }
//        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
