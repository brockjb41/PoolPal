//
//  CoreDataStack.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/12/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PoolPalDataModel")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                fatalError()
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    static func save() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error: There was a problem saving, \(error.localizedDescription)")
        }
    }
}
