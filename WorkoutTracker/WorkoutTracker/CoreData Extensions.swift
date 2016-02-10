//
//  CoreData Extensions.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 2/10/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//
import CoreData
import Foundation

extension WorkoutsTableViewController {
    
    func startCoreData() {
        let modelURL = NSBundle.mainBundle().URLForResource("WorkoutTracker", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let url = getDocumentsDirectory().URLByAppendingPathComponent("WorkoutTracker.sqlite")
        
        do {
            
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
            managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            managedObjectContext.persistentStoreCoordinator = coordinator
        } catch {
            print(error)
            return
        }
        
    }
    private func getDocumentsDirectory() -> NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[0]
    }
}