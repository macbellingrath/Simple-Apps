//
//  HTML.swift
//  TextViewCells
//
//  Created by Mac Bellingrath on 12/1/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation
import UIKit


let html = "<p>With an 11:30am ceremony, our day started early. Like, we had to be at the venue for hair and makeup to start at 7am-early. No one protested thank goodness. Here’s some pics of my girls getting ready, the bridal suite, etc.  Shortly after this pic, they brought us in plates of fruit and cheese to put on that stand and there was also a big ice bucket filled with sodas, carafes of various juices and some wine.  They really took care of us!   <img src=\"https://wwcdn.weddingwire.com/wedding/4165001_4170000/4165258/thumbnails/400x400_1454616940065-starbucks-bride.jpg\"><img src=\"https://wwcdn.weddingwire.com/wedding/4165001_4170000/4165258/thumbnails/400x400_1454616945120-melissa-and-crystal-makeup.jpg\"><img src=\"https://wwcdn.weddingwire.com/wedding/4165001_4170000/4165258/thumbnails/400x400_1454616951017-bridal-suite-champagne.jpg\"></p>"



struct HTMLDocumentModel {
   
    let lines : [NSAttributedString]
    
    init() {
      let attributed = attributedHTML(string: html)
        
        lines = attributed
            .string
            .componentsSeparatedByString(". ")
            .flatMap {
                let range = (attributed.string as NSString).rangeOfString($0)
                return range.location == NSNotFound  ? nil  : attributed.attributedSubstringFromRange(range)
        }
    }
}