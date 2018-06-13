//
//  User+CoreDataProperties.swift
//  
//
//  Created by Brock Boyington on 6/12/18.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var appleUserRef: String?
    @NSManaged public var cloudKitRecordID: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var pools: NSSet?

}

// MARK: Generated accessors for pools
extension User {

    @objc(addPoolsObject:)
    @NSManaged public func addToPools(_ value: Pool)

    @objc(removePoolsObject:)
    @NSManaged public func removeFromPools(_ value: Pool)

    @objc(addPools:)
    @NSManaged public func addToPools(_ values: NSSet)

    @objc(removePools:)
    @NSManaged public func removeFromPools(_ values: NSSet)

}
