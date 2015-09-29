//: Playground - noun: a place where people can play

import UIKit


protocol ChildDelegate {
    
    func iAmHungry()

}


class Parent: ChildDelegate {
    
    var children: [Child] = []
    
    func makeABaby() {
        let baby = Child()
        baby.delegate = self
        children.append(baby)
    }
    
    func iAmHungry() {
        print("feeding child")
    }
}

class Child {
    var delegate: ChildDelegate?
    func bellyRumbles() {
        delegate?.iAmHungry()
    }
}

var child = Child()

var parent = Parent()

child.delegate = parent
child.bellyRumbles()


var objects = [
    ["name": "Jo", "likes": 12],
    ["name": "Anjel", "likes": 12],
    ["name": "Kelly", "likes": 12],
    ["name": "Suzanne", "likes": 12],
    ["name": "Joe", "likes": 12],
    ["name": "Alex", "likes": 12],
    ["name": "Mac", "likes": 12]
]



objects[0]
objects[0]["likes"]