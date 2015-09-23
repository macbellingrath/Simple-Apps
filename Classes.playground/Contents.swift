//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Box {
    var color: UIColor?
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    func changeSize(size: CGSize) {
        
        height = size.height
        width = size.width
    }
    

}

var box1 = Box()
var box2 = Box()

box1.changeSize(CGSize(width: 10, height: 10))
box2.changeSize(CGSize(width: 20, height: 10))