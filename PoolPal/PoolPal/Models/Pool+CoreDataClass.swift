//
//  Pool+CoreDataClass.swift
//  
//
//  Created by Brock Boyington on 6/12/18.
//
//

import Foundation
import CoreData

@objc(Pool)
public class Pool: NSManagedObject {
    convenience init(creator: Bool,
                        name: String,
                     context: NSManagedObjectContext = CoreDataStack.context) {
            self.init(context: context)
            self.creator = creator
            self.name = name
        }
}
