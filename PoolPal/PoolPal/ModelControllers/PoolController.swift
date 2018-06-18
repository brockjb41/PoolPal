//
//  PoolController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CloudKit

class PoolController {
    static let shared = PoolController()
    var currentPool: Pool?
    var pools = [Pool]()
    
    func createPool(name: String, isCreator: Bool, style: String, completion: @escaping(Bool) -> Void) {
        
        guard let loggedInUserCKRecordID = UserController.shared.loggedInUser?.cloudKitRecordID else { return }
        
        let creatorRef = CKReference(recordID: loggedInUserCKRecordID, action: .deleteSelf)
        
        let newPool = Pool(name: name, isCreator: isCreator, style: style, creatorRef: creatorRef)
        
        let record = CKRecord(pool: newPool)
        
        CKController.shared.publicDB.save(record, completionHandler: { (_, error) in
            if let error = error {
                print("Error saving pool to publicDB: \(error)")
                completion(false)
                return
            }
            self.currentPool = newPool
            completion(true)
        })
    }
    
    func fetchPools(completion: @escaping(Bool) -> Void) {
        let predicate = NSPredicate(value: true)
        
        CKController.shared.fetch(type: Pool.poolTypeKey, predicate: predicate) { (poolRecords, error) in
            if let error = error {
                print("error fetching pools from CK: \(error)")
                completion(false)
                return
            }
            
            guard let poolRecords = poolRecords else { completion(false); return }
            
            for poolRecord in poolRecords {
                guard let pool = Pool(ckRecord: poolRecord) else { continue }
                
                self.pools.append(pool)                
            }
            completion(true)
        }
    }
    
    
    func deletePool(record: CKRecord) {
        
    }
}

