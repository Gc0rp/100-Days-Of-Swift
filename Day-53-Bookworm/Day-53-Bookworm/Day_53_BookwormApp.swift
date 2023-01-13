//
//  Day_53_BookwormApp.swift
//  Day-53-Bookworm
//
//  Created by Ojas Gupta on 13/1/2023.
//

import SwiftUI

@main
struct Day_53_BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
