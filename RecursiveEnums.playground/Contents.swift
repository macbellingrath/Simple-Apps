

import UIKit


enum Tree<T> {
    case Empty
    indirect case Node(value: Int, left: Tree, right: Tree)
}

let tree: Tree<Int> = .Node(value: 0, left: .Empty, right: .Empty)


let t = [

    "l" : [
      
        "l" : "n",
        "r" : "n"
        
    ]

]




let arrays = [[1,2,3],[4,5,6],[7,8,9]]

for (r,row) in arrays.enumerate() {
    r
    row
}


var array = [[1,2],[3,4],[5,6],[7,8],[9,10]]

//Mac's example using functional programming style
array
    .flatMap{ $0 }
    .filter { (s) in s <= 5}
    .count > 0


//Imperative Style
var emptyArray: [Int] = []

for i in array {
    for j in i {
        if j <= 5 {
            emptyArray.append(j)
        }
    }
    
}
if emptyArray.count > 0 {
    print("true")
}
array.map { array.append($0)}




var emptyDict: [String: Int] = [:]

let roomates = ["Mac","Bowen","Davin"]

var i = 1

for roommate in roomates {
   
    emptyDict[roommate] = i
   
    i++
    
    print(emptyDict)
}









