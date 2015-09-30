//
//  ViewController.swift
//  DrawSomething
//
//  Created by Mac Bellingrath on 9/29/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit


//// Normal
//
//- Create a New App "DrawSomething"
//    - Create a New File "DrawView" based on "UIView"
//        - Using "CGContextRef"
//            - draw a blue circle on the view
//                - draw a square with a red outline that is 10 pt thick
//
//// Hard
//
//- Add "BeginTouches" Function
//- Print "CGPoint" from location of touch
//- Using "CGContextRef"
//- draw a green triangle
//
//// Nightmare
//
//- Using "CGContextRef"
//- draw a scribble using arcs
//
//jo [4:45 PM]


class ViewController: UIViewController {


    @IBOutlet weak var shapeView: DrawView!



    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
