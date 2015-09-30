//: Playground - noun: a place where people can play

import UIKit
import XCPlayground




class SomeClass: ClassProtocol{
    var aVar: String!
    
    
    required init(avar: String) {
        self.aVar = avar
    }
}

protocol ClassProtocol: class {
    
    var aVar: String! {get set}
    
    init (avar: String)
}



func makeRect() {
    
}
typealias rect = makeRect()


var rectmaker = makeRect()