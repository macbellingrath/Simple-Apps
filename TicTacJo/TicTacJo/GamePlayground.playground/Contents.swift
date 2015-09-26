//: Playground - noun: a place where people can play

import Cocoa


struct Board {
    var fields: [String?]
    
    
    init() {
        self.fields = [String?]()
        
        for _ in 0...9 {
            fields.append(nil)
        }
    }
}