//
//  NewCategoryViewController.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData

class NewCategoryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var categoryName: UITextField!
    
    @IBOutlet weak var ColorPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!

    

    @IBAction func cancel(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func createButtonPressed(sender: AnyObject) {
        
      guard let appD = UIApplication.sharedApplication().delegate as? AppDelegate else { return }
        
        let newCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: appD.managedObjectContext)
        
        newCategory.setValue(categoryName.text, forKey: "name")

        newCategory.setValue(datePicker.date, forKey: "date") 
        
        appD.saveContext()
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
