//
//  Day_57App.swift
//  Day-57
//
//  Created by Ojas Gupta on 17/1/2023.
//

import SwiftUI

@main
struct Day_57App: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
