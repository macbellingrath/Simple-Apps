//
//  ViewController.swift
//  StoryboardLess
//
//  Created by Mac Bellingrath on 9/24/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
   

    
    
    var isPlayer1Turn: Bool = false
    
 
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    var currentTurn = 0
    let maxNumOfTurns = 9
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
               
        
        for (r,row) in grid.enumerate() {
            
            for (c,_) in row.enumerate() {
                
                let x = r * 110
                let y = c * 110
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: 100, height: 100))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c

                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
                
                
                
            }
        }
        
    }
    
    
    func spacePressed(button: TTTButton) {
        print("button pressed")
        
        if button.player == 0 {
            
            button.player = isPlayer1Turn ? 1 : 2
            grid[button.row][button.col] = isPlayer1Turn ? 1:2
            
            isPlayer1Turn = !isPlayer1Turn
            checkForWinner()
        }
    }
    
    func checkForWinner() {
     
        while currentTurn < maxNumOfTurns {
        
        //row 1 0,0 0,1 0,2
        //row 2 1,0 1,1 1,2
        //row 3 2,0 2,1 2,2
        //col 1 0,0 1,0 2,0
        //col 2 0,1 1,1 2,1
        //col 3 0,2 1,2 2,2
        // diag left 0,0 1,1 2,2
        //diag right 2,0 1,1 0,2
        
       let posibilities = [
        
        ((0,0),(0,1),(0,2)),
        ((1,0),(1,1),(1,2)),
        ((2,0),(2,1),(2,2)),
        ((0,0),(1,0),(2,0)),
        ((0,1),(1,1),(2,1)),
        ((0,2),(1,2),(2,2)),
        ((0,0),(1,1),(2,2)),
        ((2,0),(1,1),(0,2))
    ]
        
        for possibility in posibilities {
            
            let (p1,p2,p3) = possibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3 {
                if value1 != 0 {
                    print(value1)
                    
                } else {
                    print("All Zeros")
                }
            } else {
                print("Does not match")
            }

        }
    
        currentTurn++
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


 }


//MARK: - TTTButton


class TTTButton: UIButton {
   
    var row = 0
    var col = 0
    
    
    var player = 0 {
        
        didSet {
            
            switch player {
                
            case 1: backgroundColor = UIColor.magentaColor()
            case 2: backgroundColor = UIColor.yellowColor()
            default: backgroundColor = UIColor.cyanColor()
            }
        }
        
    }
    

    
    
   
    
    
}
