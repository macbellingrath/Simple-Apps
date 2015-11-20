//
//  NewCategoryViewController.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData

class NewCategoryViewController: UIViewController {
    
    var colors = [UIColor.magentaColor(), UIColor.mandyColor(), UIColor.capeCodColor(), UIColor.mantisColor()]

    @IBOutlet weak var categoryName: UITextField! {
        didSet { categoryName.delegate = self }
    }
    
    @IBOutlet weak var ColorPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!

   

    @IBAction func cancel(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func createButtonPressed(sender: AnyObject) {
        
      createCategory()
      dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
   
}





