//
//  ExpenseItem.swift
//  Day-37
//
//  Created by Ojas Gupta on 23/12/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
