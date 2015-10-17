//: Playground - noun: a place where people can play

import UIKit






let array:[Int?] = [1,nil,nil,2]

let newArray = array.flatMap{ $0 }




newArray.map{$0 * 5}



.reduce(<#T##initial: T##T#>, combine: <#T##(T, Int) throws -> T#>)