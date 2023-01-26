//
//  Friend.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 21/1/2023.
//

import Foundation

public struct Friend: Codable, Identifiable, Hashable {
    public let id: String
    var name: String
}
