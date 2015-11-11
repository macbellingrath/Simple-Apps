//
//  Image.swift
//  SnappyCam
//
//  Created by Mac Bellingrath on 11/11/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import RealmSwift

class ImageURL: Object {
    
    dynamic var url: String = ""
    
    
override class func primaryKey() -> String? {
        return "url"
    }

}
    