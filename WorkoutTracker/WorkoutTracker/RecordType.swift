//
//  RecordType.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation

protocol RecordType {
    static var recordTypeIdentifier: String { get }
    var recordTitle: String { get set }
}

