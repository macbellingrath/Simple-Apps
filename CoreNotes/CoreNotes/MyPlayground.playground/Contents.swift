//: Playground - noun: a place where people can play

import UIKit


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

struct Category {
    var name = "Hello"
    
}

struct Note {
    var text = "Lovely Note Text"
}

let cat1 = Category()
let note1 = Note()
let note2 = Note()


var newCategoryDictionary: [[String : Any]] = [["category": cat1, "notes": [note1,note2]]]




