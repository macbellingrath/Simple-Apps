//
//  TableViewCellExtensions.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

enum TableViewCellIdentifierType: String {
   case WorkoutCell
}


protocol CellRepresentable {
    func configure(record: RecordType)
}

