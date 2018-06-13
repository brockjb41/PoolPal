//
//  User.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

//import Foundation
//import CloudKit
//import CoreData
//
//extension User {
    
//    static let userTypeKey = "User"
//    fileprivate static let usernameKey = "username"
//    fileprivate static let emailKey = "email"
//    fileprivate static let passwordKey = "password"
//    fileprivate static let appleUserRefKey = "appleUserRef"
//    fileprivate static let cloudKitRecordIDKey = "cloudKitRecordID"
//    
//    var cloudKitRecordID = CKRecordID(recordName: name)
//    let appleUserRef: CKReference
//
//    convenience init(appleUserRef: CKReference, cloudKitRecordID: CKRecordID) {
//        self.appleUserRef = appleUserRef
//        self.cloudKitRecordID = cloudKitRecordID
//    }
//
//    convenience init?(ckRecord: CKRecord) {
//        guard let appleUserRef = ckRecord[User.appleUserRefKey] as? CKReference
//            else { return nil }
//
//        self.appleUserRef = appleUserRef
//
//        self.cloudKitRecordID = ckRecord.recordID
//    }
//}
//
//extension CKRecord {
//    convenience init(user: User) {
//
//        let recordID = user.cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
//
//        self.init(recordType: User.userTypeKey, recordID: recordID)
//        self.setValue(user.email, forKey: User.emailKey)
//        self.setValue(user.password, forKey: User.passwordKey)
//        self.setValue(user.username, forKey: User.usernameKey)
//        self.setValue(user.appleUserRef, forKey: User.appleUserRefKey)
//
//        user.cloudKitRecordID = recordID
//    }
//}

