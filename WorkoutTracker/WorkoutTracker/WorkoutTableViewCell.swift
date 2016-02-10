//
//  WorkoutTableViewCell.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell, CellRepresentable {
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(record: RecordType) {
        self.textLabel?.text = record.recordTitle
    }

}
