//
//  Candy+CoreDataProperties.swift
//  Day-58
//
//  Created by Ojas Gupta on 19/1/2023.
//
//

import Foundation
import CoreData


extension Candy {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}

extension Candy : Identifiable {

}
