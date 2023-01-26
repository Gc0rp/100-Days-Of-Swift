//
//  CachedFriend+CoreDataClass.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 25/1/2023.
//
//

import Foundation
import CoreData


public class CachedFriend: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case name, id
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = try encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var id = try container.decode(String.self, forKey: .id)
        var name = try container.decode(String.self, forKey: .name)
    }
}
