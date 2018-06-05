//
//  CKController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CloudKit

class CKController {
    static let shared = CKController()
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    func fetch(type: String, predicate: NSPredicate,completion: @escaping([CKRecord]?, Error?) -> Void) {
        let query = CKQuery(recordType: type, predicate: predicate)
        publicDB.perform(query, inZoneWith: nil, completionHandler: completion)
    }
}
