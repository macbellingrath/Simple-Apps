//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var age = 23
let name = "Mac"

age += 1


enum OperationType: String {
    case Addition = "+"
    case Subtraction = "-"
    case Multiplication = "x"
    case Division = "/"
    case Modulo = "%"
}

func performOperation(x: Double,  y: Double, operation: OperationType)  -> Double {
 
    switch operation {
    
    case .Addition:
        return x + y
   
    case .Subtraction:
        return x - y
    case .Multiplication:
        return x * y
    case .Division:
        return x / y
    case .Modulo:
        return x % y
    }
    
    
    
}



func calculateFutureAge(age: Int, withYears: Int) -> Int {
   
    return age + withYears
    
}

protocol myProtocol {
    var name: String {get set}
}


class Student: myProtocol {
    
    var name = "Mac"
    
}



let myFutureAge = calculateFutureAge(23, withYears: 5)

let num1: Int = 0


//



 
    
var num = -5

switch num {
    
case 0...100 :
    print("0 - 100")
case let x where x<0 :
    print("less than zero")
default:
    print("default")
    
}








var testArray2: [[Int?]] = [[1,2,3],[nil,5,nil]]
let values2 = testArray2.flatMap{ $0.map { $0 } }

values2


var testArray1: [Int?] = [1,2,3,nil,5,nil]
let values1 = testArray1.flatMap{ $0 }

values1



var testArray: [[Int]] = [[1,2,3],[4,5,6]]
let values = testArray.flatMap{ $0 }

values














