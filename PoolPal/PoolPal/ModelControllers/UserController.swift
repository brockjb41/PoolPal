//
//  UserController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CloudKit

class UserController {
    static var shared = UserController()
    //    var loggedInUser: User?
    
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
            })
        }
    }
    
    func createNewUser(username: String, firstName: String, lastName: String, homeAirport: String?, appleUserRef: CKR )
}
