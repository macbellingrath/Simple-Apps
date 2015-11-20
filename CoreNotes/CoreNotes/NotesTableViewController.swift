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
    
    
    private let headerHeight: CGFloat = 40
    
    
    var categories: [CategoryDictionary] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
   fetchCategoriesAndNotes()
        
    

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCategoriesAndNotes()
        
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose, target: self, action: "sendBanana")
        
            
    }
    
  
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories[section].notes.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = categories[indexPath.section].notes[indexPath.row].text

        return cell
        
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      
        if editingStyle == .Delete {
       
            //Note
            let note = categories[indexPath.section].notes[indexPath.row]
            
            // Remove note from CoreData
            deleteNote(note)
            
            //remove note from dictionary
            categories[indexPath.section].notes.removeAtIndex(indexPath.row)
            
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        let categoryView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: headerHeight))
        categoryView.backgroundColor = categories[section].category.color ?? UIColor.capeCodColor()
        let label = UILabel(frame: categoryView.frame)
    
        label.text = categories[section].category.name

        
        
        label.textAlignment = .Center
    
        label.textColor = UIColor.whiteColor()

        categoryView.addSubview(label)

        
        return categoryView
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        
    }
    

}




