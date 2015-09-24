

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




let array = [[1,2,3],[4,5,6],[7,8,9]]

for (r,row) in array.enumerate() {
    r
    row
}