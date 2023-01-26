//
//  CachedFriend+CoreDataProperties.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 25/1/2023.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var user: CachedUser?
    
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    

}

extension CachedFriend : Identifiable {

}
