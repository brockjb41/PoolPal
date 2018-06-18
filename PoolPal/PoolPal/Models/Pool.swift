//
//  Pool.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/14/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CloudKit

class Pool {
    
    static let poolTypeKey = "Pool"
    static let isCreatorKey = "isCreator"
    static let styleKey = "style"
    static let creatorRefKey = "creatorRef"
    static let nameKey = "name"
    
    let name: String
    var isCreator: Bool
    let style: String
    var cloudKitRecordID: CKRecordID?
    let creatorRef: CKReference
    var participantReferences: [CKReference]?
    
    init(name: String, isCreator: Bool, style: String, creatorRef: CKReference) {
        self.isCreator = isCreator
        self.style = style
        self.creatorRef = creatorRef
        self.name = name
    }
    
    init?(ckRecord: CKRecord) {
        guard let isCreator = ckRecord[Pool.isCreatorKey] as? Bool,
            let name = ckRecord[Pool.nameKey] as? String,
            let creatorRef = ckRecord[Pool.creatorRefKey] as? CKReference,
            let style = ckRecord[Pool.styleKey] as? String else { return nil }
        
        self.isCreator = isCreator
        self.style = style
        self.creatorRef = creatorRef
        self.name = name
        self.cloudKitRecordID = ckRecord.recordID
    }
}

extension CKRecord {
    convenience init(pool: Pool) {
        
        let recordID = pool.cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        self.init(recordType: Pool.poolTypeKey, recordID: recordID)
        self.setValue(pool.isCreator, forKey: Pool.isCreatorKey)
        self.setValue(pool.style, forKey: Pool.styleKey)
        self.setValue(pool.creatorRef, forKey: Pool.creatorRefKey)
        self.setValue(pool.name, forKey: Pool.nameKey)
        
        pool.cloudKitRecordID = recordID
    }
}
