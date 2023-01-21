//
//  User.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import Foundation


struct User: Codable, Identifiable {
    let id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
