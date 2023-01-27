//
//  CachedFriend+CoreDataProperties.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 27/1/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    var wrappedName: String {
        name ?? "Unknown name"
    }
}

extension CachedFriend : Identifiable {

}
