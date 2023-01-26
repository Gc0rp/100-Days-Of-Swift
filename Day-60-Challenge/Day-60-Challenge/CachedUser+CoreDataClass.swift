//
//  CachedUser+CoreDataClass.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 25/1/2023.
//
//

import Foundation
import CoreData

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

public class CachedUser: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
           case id, isActive, name, age, company, email, address, about, registered, tags, friends
       }
    
    
    
   public func encode(to encoder: Encoder) throws {
       
       var container = encoder.container(keyedBy: CodingKeys.self)
       
       try container.encode(id, forKey: .id)
       try container.encode(isActive, forKey: .isActive)
       try container.encode(name, forKey: .name)
       try container.encode(age, forKey: .age)
       try container.encode(company, forKey: .company)
       try container.encode(email, forKey: .email)
       try container.encode(address, forKey: .address)
       try container.encode(about, forKey: .about)
       try container.encode(registered, forKey: .registered)
       try container.encode(tagsArray, forKey: .tags)
       try container.encode(friendsArray, forKey: .friends)
   }
       
       
       
   public required convenience init(from decoder: Decoder) throws {
       
       guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
         throw DecoderConfigurationError.missingManagedObjectContext
       }
       
       self.init(context: context)
       
       let container = try decoder.container(keyedBy: CodingKeys.self)
       
       var id = try container.decode(String.self, forKey: .id)
       var isActive = try container.decode(Bool.self, forKey: .isActive)
       var name = try container.decode(String.self, forKey: .name)
       var age = try container.decode(Int16.self, forKey: .age)
       var company = try container.decode(String.self, forKey: .company)
       var email = try container.decode(String.self, forKey: .email)
       var address = try container.decode(String.self, forKey: .address)
       var about = try container.decode(String.self, forKey: .about)
       var registered = try container.decode(Date.self, forKey: .registered)
       var tags = try container.decode([String].self, forKey: .tags)
       var friends = try container.decode([CachedFriend].self, forKey: .friends)
       
   }
}
