
import UIKit


public class AVLTree <T: Comparable> {
    
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    
    func addNode(key: T) {
        
        
        //check for head node
        if (self.key == nil) {
            self.key = key
            return
        }
        
       
        //Check left
        
        if (key < self.key){
            
            if (self.left != nil) {
                
                left?.addNode(key)
                
            } else {
                
                // create new left node
                var leftChild = AVLTree()
                leftChild.key = key
                self.left = leftChild
        
            }
        
            //Check right
            
            if (key > self.key) {
                
                if (self.right != nil) {
                    
                    right?.addNode(key)
                    
                } else {
                    
                    //create new right node
                    var rightChild = AVLTree()
                    rightChild.key = key
                    self.right = rightChild
                    
                }
            }
        }
    }
}



// An array of unsorted Ints
let numberList =  [8, 2, 10, 9, 11, 1, 7]

//create new BST instance

var root = AVLTree<Int>()

for number in numberList {
    
    root.addNode(number)
    
}

root



var sorted = numberList.sort { (item1, item2) -> Bool in
    
    return item1 < item2
    
}

sorted








