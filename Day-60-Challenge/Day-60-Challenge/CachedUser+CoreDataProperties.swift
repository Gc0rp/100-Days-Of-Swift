//
//  CachedUser+CoreDataProperties.swift
//  Day-60-Challenge
//
//  Created by Ojas Gupta on 26/1/2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?


    public var wrappedName: String {
        name ?? "Unknown Name"
    }

    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }

    public var wrappedEmail: String {
        email ?? "Unknown Email"
    }

    public var wrappedAddress: String {
        address ?? "Unknown Address"
    }

    public var wrappedAbout: String {
        about ?? ""
    }

    public var wrappedRegistered: Date {
        registered ?? Date.now
    }



//    public var tagsArray: Set<String> {
//        let set = tags as? Set<String> ?? []
//        return set
//    }

    public var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
//
        return set.sorted(by: {$0.wrappedName < $1.wrappedName})
    }

}

// MARK: Generated accessors for friend
extension CachedUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CachedFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CachedFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
