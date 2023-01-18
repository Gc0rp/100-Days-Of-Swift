//
//  Day_58App.swift
//  Day-58
//
//  Created by Ojas Gupta on 18/1/2023.
//

import SwiftUI

@main
struct Day_58App: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
