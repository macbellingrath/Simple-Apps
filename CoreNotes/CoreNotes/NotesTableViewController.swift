//
//  NotesTableViewController.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData





class NotesTableViewController: UITableViewController {
    
    // [[ "name": "category:, "notes" : [NSManagedObject]]]
    
    private let headerHeight: CGFloat = 40
    
    
    var categories: [[String: AnyObject]] = [] {
        
        didSet {
            tableView.reloadData()
        }
    }
    
//    [
        //array of category
//        [
//            category dictionary
//            "category" : NSManagedObject,
// notes array
//            "notes" : [
            //note object
//            NSManagedObject,
//            NSManagedObject
//                
//            ]
//        ]
//    ]
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        guard let appd = UIApplication.sharedApplication().delegate as? AppDelegate else {return }
        
        let categoryRequest = NSFetchRequest(entityName: "Category")
        
        let foundCategories = (try? appd.managedObjectContext.executeFetchRequest(categoryRequest) as? [NSManagedObject] ?? []) ?? []
        
        
        
        for category in foundCategories {
            
            var newCategoryDictionary = [
                "category" : category,
                "notes" : []
            ]
            
            //fetch notes for category
            let noteFetchRequest = NSFetchRequest(entityName: "Note")
            
            noteFetchRequest.predicate = NSPredicate(format: "category == %@", category)
            
            let foundNotes = (try? appd.managedObjectContext.executeFetchRequest(noteFetchRequest) as? [NSManagedObject] ?? []) ?? []
            newCategoryDictionary["notes"] = foundNotes
            
            categories.append(newCategoryDictionary)

        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetch notes for category
        
        
        guard let appd = UIApplication.sharedApplication().delegate as? AppDelegate else {return }
        
        let categoryRequest = NSFetchRequest(entityName: "Category")
        
        let foundCategories = (try? appd.managedObjectContext.executeFetchRequest(categoryRequest) as? [NSManagedObject] ?? []) ?? []
        
    
        
        for category in foundCategories {
            
            var newCategoryDictionary = [
                "category" : category,
                "notes" : []
            ]
            
            //fetch notes for category
            let noteFetchRequest = NSFetchRequest(entityName: "Note")
            
            noteFetchRequest.predicate = NSPredicate(format: "category == %@", category)
            
            let foundNotes = (try? appd.managedObjectContext.executeFetchRequest(noteFetchRequest) as? [NSManagedObject] ?? []) ?? []
            newCategoryDictionary["notes"] = foundNotes
            
            categories.append(newCategoryDictionary)
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return 1

        
        let category = categories[section]
        let notes = category["notes"] as? [AnyObject]
        
        return notes?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
       //To-Do
        cell.textLabel?.text = "Note"
        
//                    as! NotesTableViewCell
        
//        cell.configure(withDatasource: NoteViewModel(), andDelegate: NoteViewModel())
        
        //get current note and set content
        

        // Configure the cell...

        return cell
        
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Remove note from CoreData
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let category = categories[section]
        let managedObject = category["category"] as? NSManagedObject
        let name = managedObject?.valueForKey("name") as? String
        
        let categoryView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: headerHeight))
        categoryView.backgroundColor = UIColor.darkGrayColor()
        
        let label = UILabel(frame: categoryView.frame)
    
        label.text = name
        
        
        label.textAlignment = .Center
    
        label.textColor = UIColor.whiteColor()

        categoryView.addSubview(label)

        
        return categoryView
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        
    }

}
