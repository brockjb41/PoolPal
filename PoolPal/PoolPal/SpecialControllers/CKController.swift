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
    
//    func save(recordsToSave: [CKRecord], completion: @escaping(Error?) -> Void) {
//        modifyRecords(recordsToSave: recordsToSave, recordIDsToDelete: nil, completion: completion)
//    }
//
//    func delete(recordIDsToDelete: [CKRecordID], completion: @escaping(Error?) -> Void) {
//        modifyRecords(recordsToSave: nil, recordIDsToDelete: recordIDsToDelete, completion: completion)
//    }
    
//    func modifyRecords(records: [CKRecord],
//                       perRecordCompletionBlock: ((CKRecord?, Error?) -> Void)?,
//                       completion: (([CKRecord]?, Error?) -> Void)?) {
//
//        let modifyOperation = CKModifyRecordsOperation(recordsToSave: records, recordIDsToDelete: nil)
//
//        modifyOperation.savePolicy = .changedKeys
//        modifyOperation.queuePriority = .high
//        modifyOperation.qualityOfService = .userInteractive
//
//        modifyOperation.perRecordCompletionBlock = perRecordCompletionBlock
//        modifyOperation.modifyRecordsCompletionBlock = { (records, _, error)  in
//            completion?(records, error)
//        }
//        publicDB.add(modifyOperation)
//    }

    
    func subscribeToPushNotifications (type: String, completion: @escaping(Error?) -> Void = { _ in }) {
        
        // create subscription object
        let subsrictionToPN = CKQuerySubscription(recordType: type, predicate: NSPredicate(value: true), options: .firesOnRecordCreation)
        
        // create a notification info object
        let notificationInfo = CKNotificationInfo()
        notificationInfo.alertBody = "A new message has been posted to the bulletin baord."
        
        // set our subscription notification info to the notification object we just created
        subsrictionToPN.notificationInfo = notificationInfo
        
        publicDB.save(subsrictionToPN) { (_, error) in
            if let error = error {
                print("There was an error saving the subscription to CK: \(error)")
                
            }
            completion(error)
        }
        
    }
}
