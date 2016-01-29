//
//  CloudKitQueryable.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation
import CloudKit

protocol CloudKitQueryable {
    static var defaultQuery: CKQuery { get }
}

extension CloudKitQueryable where Self: RecordType  {
    static var defaultQuery: CKQuery {
    return CKQuery(recordType: self.recordTypeIdentifier, predicate: NSPredicate(value: true))
    }
}