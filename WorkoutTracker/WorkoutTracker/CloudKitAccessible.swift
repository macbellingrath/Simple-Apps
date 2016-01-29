//
//  CloudKitAccessible.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation
import CloudKit

protocol CloudKitAccessible {
    
    var publicCloudDatabase: CKDatabase { get }
    var privateCloudDatabase: CKDatabase { get }
    var container: CKContainer { get }
    var iCloudAvailable: Bool { get }
}

extension CloudKitAccessible {
    
    var container: CKContainer {
       return CKContainer.defaultContainer()
    }
    var publicCloudDatabase: CKDatabase {
        return container.publicCloudDatabase
    }
   var privateCloudDatabase: CKDatabase {
        return container.privateCloudDatabase
    }
    var iCloudAvailable: Bool {
        return  NSFileManager.defaultManager().ubiquityIdentityToken != nil
    }
}

extension CloudKitAccessible where Self: AlertControllerDisplayable {
    
    func checkAccountStatus() {
    container.accountStatusWithCompletionHandler { (accountStatus, error) in
    
    guard error == nil else {
        self.displayAlert("Error", message: "An Error occured")
        return
    }
        
    switch accountStatus {
        
        case .Available: break
        
        default: self.displayAlert("Error", message: "An Error occured")
    
        }
        
        }
    }
}