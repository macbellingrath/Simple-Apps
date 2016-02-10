//
//  Workout.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation
import CoreData

class Workout: NSManagedObject, RecordType, CloudKitQueryable {
    static var recordTypeIdentifier: String {
        return "Workout"
    }
    
    static let CKRECORDID = "Workout"
    static let entityName = "Workout"
    var recordTitle : String {
        get { return self.name }
        set { name = newValue }
    }
    
 
    static func entityDescription(moc: NSManagedObjectContext) -> NSEntityDescription {
       return NSEntityDescription.entityForName("Workout", inManagedObjectContext: moc)!
    }
}