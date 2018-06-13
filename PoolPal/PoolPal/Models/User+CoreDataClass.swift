//
//  User+CoreDataClass.swift
//  
//
//  Created by Brock Boyington on 6/12/18.
//
//

import Foundation
import CoreData
import CloudKit

@objc(User)
public class User: NSManagedObject {
    
    static let userTypeKey = "User"
    fileprivate static let usernameKey = "username"
    fileprivate static let emailKey = "email"
    fileprivate static let passwordKey = "password"
    fileprivate static let appleUserRefKey = "appleUserRef"
    fileprivate static let cloudKitRecordIDKey = "cloudKitRecordID"
    
    var cloudKitRecordID: CKRecordID?
    let appleUserRef: CKReference
    
    convenience init(appleUserRef: CKReference, cloudKitRecordID: CKRecordID) {
        self.appleUserRef = appleUserRef
        self.cloudKitRecordID = cloudKitRecordID
    }
    
    init?(ckRecord: CKRecord) {
        guard let appleUserRef = ckRecord[User.appleUserRefKey] as? CKReference
            else { return nil }
        
        self.appleUserRef = appleUserRef
        
        self.cloudKitRecordID = ckRecord.recordID
    }
    
    convenience init(username: String,
                     email: String,
                     password: String,
                     context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.username = username
        self.email = email
        self.password = password
    }
}

extension CKRecord {
    convenience init(user: User) {
        
        let recordID = user.cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        self.init(recordType: User.userTypeKey, recordID: recordID)
        self.setValue(user.email, forKey: User.emailKey)
        self.setValue(user.password, forKey: User.passwordKey)
        self.setValue(user.username, forKey: User.usernameKey)
        self.setValue(user.appleUserRef, forKey: User.appleUserRefKey)
        
        user.cloudKitRecordID = recordID
    }
}
