//
//  CoreData.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/17/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//


import UIKit
import CoreData

private let _appDelegate = { return UIApplication.sharedApplication().delegate as? AppDelegate }()


extension NSManagedObject {
    
    class func delegateAndEntity(name: String) -> (NSManagedObjectContext, NSEntityDescription)?  {
        
        guard let _appDelegate = _appDelegate else { return nil }
        
        guard let entity =  NSEntityDescription.entityForName(name, inManagedObjectContext: _appDelegate.managedObjectContext) else { return  nil }
       
        return (_appDelegate.managedObjectContext , entity)
    }
    
}

class Category: NSManagedObject {

    
  @NSManaged var name: String?
  @NSManaged var color: UIColor?
  @NSManaged var date: NSDate?
    
  class func category() -> Category? {
        
        guard let (moc, entity) = delegateAndEntity("Category") else { return nil }
        return Category.init(entity: entity, insertIntoManagedObjectContext: moc)
    }

    
}
class Note: NSManagedObject {
    
    
    class func note() -> Note? {
        
        guard let (moc, entity) = delegateAndEntity("Note") else { return nil }
        return Note.init(entity: entity, insertIntoManagedObjectContext: moc)
        }
    
   @NSManaged var text: String?
   @NSManaged var category: NSManagedObject?
   @NSManaged var createdAt: NSDate?

}



struct CategoryDictionary {
    
//    subscript(index)
    var category: Category!
    var notes: [Note] = []
    
}

extension NotesTableViewController: Fetchable {
    
    func fetchCategoriesAndNotes() {

        categories = []
        
        fetchEntity("Category", predicates: nil) { [weak self] (found) -> Void in
            
            guard let foundCategories = found as? [Category] else { return }
            
            for category in foundCategories {
                
                var newCategoryD = CategoryDictionary()
                
                newCategoryD.category = category
                
                let predicate = NSPredicate(format: "category == %@", category)
                
                self?.fetchEntity("Note", predicates: [predicate], completion: { (found) -> Void in
                    
                    newCategoryD.notes = found as? [Note] ?? []
                    
                })
                
//                let rslts = newCategoryD({$0})
                self?.categories.append(newCategoryD)
                
            }
        }
    }
    
}





extension NewNoteViewController: Fetchable {
    
    func fetchCategories() {
        
       fetchEntity("Category", predicates: nil) { (found) -> Void in
        
            self.categories = found as? [Category] ?? []
            self.categoryPicker.reloadAllComponents()
        }
    }

    
    func createNote() {
        
        let newNote = Note.note()
        newNote?.text = textView.text
        newNote?.createdAt = NSDate()
        
        //get category from picker
        newNote?.category = categories[categoryPicker.selectedRowInComponent(0)]
        
        //Save
        _appDelegate?.saveContext()
        
    }

}

protocol Fetchable {
    
 func fetchEntity(name: String, predicates: [NSPredicate]?, completion: (found: [AnyObject]) -> Void)
}

extension Fetchable {
    
    func fetchEntity(name: String, predicates: [NSPredicate]?, completion: (found: [AnyObject]) -> Void) {
        
        let request = NSFetchRequest(entityName: name)
        
        //Do something with predicates later
        
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates ?? [])
        
        guard let foundObjects =  try? _appDelegate?.managedObjectContext.executeFetchRequest(request) ?? [] else { return completion(found: [] ) }
        
        completion(found: foundObjects)
        
    }
    
    func deleteNote(note: Note) {
        _appDelegate?.managedObjectContext.deleteObject(note)
        _appDelegate?.saveContext()
    }

}

extension NewCategoryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return colors.count
        
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 30))
        view.backgroundColor = colors[row]
        
        return view
    }
    
    func createCategory() {
        
        let newCategory = Category.category()
        newCategory?.name  = categoryName.text
        newCategory?.color = colors[ColorPicker.selectedRowInComponent(0)]
        _appDelegate?.saveContext()
    }
    
    
}











