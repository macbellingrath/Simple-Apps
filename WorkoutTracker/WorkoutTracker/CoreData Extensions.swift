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
        let modelURL = NSBundle.mainBundle().URLForResource("Workout", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let url = getDocumentsDirectory().URLByAppendingPathComponent("WorkoutTracker.sqlite")
        
        do {
            
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
            managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            managedObjectContext.persistentStoreCoordinator = coordinator
            managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        } catch {
            print(error)
            return
        }
        
    }
    
    func loadSavedData() {
        let fetch = NSFetchRequest(entityName: Workout.entityName)
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetch.sortDescriptors = [sort]
        
        do {
            if let workouts = try managedObjectContext.executeFetchRequest(fetch) as? [Workout] {
               self.workouts = workouts
                
            }
                
            } catch {
                print(error)
                
            }
    }
    
    func saveContext() {
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        } catch {
            fatalError("an error occured saving the context")
        }
    }
    private func getDocumentsDirectory() -> NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[0]
    }
}