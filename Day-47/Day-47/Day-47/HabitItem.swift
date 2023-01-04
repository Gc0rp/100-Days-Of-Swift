//
//  HabitItem.swift
//  Day-47
//
//  Created by Ojas Gupta on 2/1/2023.
//

import Foundation


struct HabitItem: Identifiable, Equatable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var completionCount: Int
}
