//
//  AlertControllerDisplayable.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/29/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

protocol AlertControllerDisplayable {

    func displayAlert(title: String, message: String)
}

extension AlertControllerDisplayable where Self: UIViewController {
    func displayAlert(title: String, message: String) {
       
        let ac = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        dispatch_async(dispatch_get_main_queue()) { [weak self] in
            self?.presentViewController(ac, animated: true, completion: nil)
        }
        
    }
}