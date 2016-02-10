//
//  WorkoutsTableViewController.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 10/23/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CloudKit
import CoreData


class WorkoutsTableViewController: UITableViewController, AlertControllerDisplayable, CloudKitAccessible {
    
    var workouts: [Workout] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "aplicationBecameActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationBecameInactive:", name: UIApplicationWillResignActiveNotification, object: nil)

       
        publicCloudDatabase.performQuery(Workout.defaultQuery, inZoneWithID: nil) { records, error in
            guard error == nil else { return }
            guard let records = records else { return }
           
            self.workouts = records.flatMap({
                guard let name = $0.valueForKey("name") as? String else { return nil }
                return Workout(recordTitle: name)
            })
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkAccountStatus()
        
        publicCloudDatabase
        
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifierType.WorkoutCell.rawValue, forIndexPath: indexPath) as! WorkoutTableViewCell
        let workout = workouts[indexPath.row]
        cell.configure(workout)
        return cell
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    

    
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }


    func aplicationBecameActive(notification: NSNotification){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleIdentityChanged:", name: NSUbiquityIdentityDidChangeNotification, object: nil)
    }

    func applicationBecameInactive(notification: NSNotification) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSUbiquityIdentityDidChangeNotification, object: nil)
    }
    
    func handleIdentitiyChanged(notification: NSNotification) {
        guard NSFileManager().ubiquityIdentityToken != nil else { return }
        

    }
}
