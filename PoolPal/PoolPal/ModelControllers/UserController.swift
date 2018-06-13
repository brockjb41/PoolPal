//
//  UserController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit
import CloudKit

class UserController {
    static var shared = UserController()
//    var pools = [Pool]()
//    var user = User()

    func fetchCurrentUser(completion: @escaping(Bool) -> Void) {

        CKContainer.default().fetchUserRecordID { (appleUserRecordID, error) in
            if let error = error {
                print("Error fetching the users apple RecordID: \(error)")
                completion(false)
                return
            }

            guard let appleUserRecordID = appleUserRecordID else { completion(false); return }

            let predicate = NSPredicate(format: "appleUserRef == %@", appleUserRecordID)

            CKController.shared.fetch(type: User.userTypeKey, predicate: predicate, completion: { (records, error) in
                if let error = error {
                    print("Error fetching user by appleUserRef: \(error)")
                    completion(false)
                    return
                }
                guard let records = records,
                    let loggedInUserRecord = records.first
                    else { completion(false); return }

                guard let loggedInUser = User(ckRecord: loggedInUserRecord) else { completion(false); return }
                self.loggedInUser = loggedInUser
                completion(true)
            })
        }
    }

    func createNewUser(username: String, email: String, password: String, completion: @escaping(Bool) -> Void) {
        CKContainer.default().fetchUserRecordID { (appleUserRecordID, error) in
            if let error = error {
                print("error getting new user record ID: \(error)")
                completion(false)
                return
            }

            guard let appleUserRecordID = appleUserRecordID else { completion(false); return }

            let appleUserRef = CKReference(recordID: appleUserRecordID, action: .deleteSelf)

            let newUser = User(username: username, email: email, password: password, appleUserRef: appleUserRef)

            let record = CKRecord(user: newUser)

            CKController.shared.publicDB.save(record, completionHandler: { (_, error) in
                if let error = error {
                    print("Error saving to user to publicDB: \(error)")
                    completion(false)
                    return
                }
                self.loggedInUser = newUser
                completion(true)
            })
        }
    }
}
