//
//  SecondViewController.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 10/23/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import Material

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let l = MaterialLayer(frame:CGRectMake(132, 132, 190, 190))
        l.backgroundColor = MaterialColor.blueGrey.darken1.CGColor
        l.shape = .Circle
        l.depth = .Depth1
        l.image = UIImage(named: "second")
    
        view.layer.addSublayer(l)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

