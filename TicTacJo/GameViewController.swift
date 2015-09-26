//
//  GameViewController.swift
//  TicTacJo
//
//  Created by Mac Bellingrath on 9/24/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let buttonArray: [TTTButton] = []
    let gameBoard = Board()
    
    var player1Symbol = ""
    var player2Symbol = ""
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
    

    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    var isPlayer1turn = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gameStatusLabel.text = "Player 1 Turn"
        
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        
        
        view.addSubview(gameStatusLabel)
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        
        let buttonHW = 100
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW)/2
        let topSpacing = (screenHeight - gridHW)/2
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        for (r,row) in grid.enumerate() {
            
            for (c,_) in row.enumerate() {
                
                let x = r * (buttonHW + buttonSpacing) + leftSpacing
                let y = c * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: 100, height: 100))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//                button.imageView?.image = UIImage(assetIdentifier: .Swifty)
                view.addSubview(button)
 
            }
        }

    }
    
    func spacePressed(button: TTTButton) {
        print("button pressed")
        
  
        
        if button.playerNum == 0 {
            
            button.playerNum =  isPlayer1turn ? 1 : 2
            grid[button.row][button.col] = isPlayer1turn ? 1:2
            
            isPlayer1turn = !isPlayer1turn
            
            if isPlayer1turn {
                
                gameStatusLabel.text = "Player 1 Turn"
                button.setImage(UIImage(assetIdentifier: .Jo), forState: .Normal)
                
            } else if !isPlayer1turn {
                
                gameStatusLabel.text = "Player 2 Turn"
                button.setImage(UIImage(assetIdentifier: .Swifty), forState: .Normal)
                
            }
            
           
            
            
            checkForWinner()
        }
    }

    func checkForWinner() {
        
        
            
        
            
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
            
    }

}

