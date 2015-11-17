//
//  NewNoteViewController.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData




class NewNoteViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBAction func cancelButtonPressed(sender: AnyObject) { dismissViewControllerAnimated(true, completion: nil) }
   
    
    @IBAction func createButtonPressed(sender: AnyObject) {
        
        guard let appd = UIApplication.sharedApplication().delegate as? AppDelegate else { return }
        
        //Create
        let newNote = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: appd.managedObjectContext)
        newNote.setValue(textView.text, forKey: "text")
        
        
        //get category from picker
        let category = categories[categoryPicker.selectedRowInComponent(0)]
        newNote.setValue(category, forKey: "category")
        
        //Save
        appd.saveContext()
        
        //Dismiss
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        categoryPicker.dataSource = self
        fetchCategories()
    }
   var categories : [NSManagedObject] = []
}


extension NewNoteViewController: UIPickerViewDataSource {
    
    func fetchCategories() {
        
        //fetch notes for category
        guard let appd = UIApplication.sharedApplication().delegate as? AppDelegate else {return }
        
        let categoryRequest = NSFetchRequest(entityName: "Category")
        
        categories = (try? appd.managedObjectContext.executeFetchRequest(categoryRequest) as? [NSManagedObject] ?? []) ?? []
        
        categoryPicker.reloadAllComponents()

    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return categories.count
        
    }
    

    
}