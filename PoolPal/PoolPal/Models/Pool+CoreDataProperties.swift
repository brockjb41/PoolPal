//
//  Pool+CoreDataProperties.swift
//  
//
//  Created by Brock Boyington on 6/12/18.
//
//

import Foundation
import CoreData


extension Pool {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pool> {
        return NSFetchRequest<Pool>(entityName: "Pool")
    }

    @NSManaged public var creator: Bool
    @NSManaged public var name: String?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension Pool {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
