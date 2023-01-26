//
//  Day_60_ChallengeApp.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import SwiftUI

@main
struct Day_60_ChallengeApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
