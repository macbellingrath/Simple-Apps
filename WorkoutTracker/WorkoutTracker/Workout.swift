//
//  Workout.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation

struct Workout: RecordType, CloudKitQueryable {
    static var recordTypeIdentifier: String {
        return "Workout"
    }
    
    static let CKRECORDID = "Workout"
    var recordTitle: String
}