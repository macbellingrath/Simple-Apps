//
//  TicTacToeViewController.swift
//  TicTacJo
//
//  Created by Mac Bellingrath on 9/25/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    
    var winner: Int!
    
    var isPlayer1Turn = true
    var p1Score = 0 {
        didSet {
           gameScoreLabel.text = "P1 Score: \(p1Score) // P2 Score: \(p2Score)"
        }
    }
    var p2Score = 0 {
        didSet {
            "P1 Score: \(p1Score) // P2 Score: \(p2Score)"
        }
    }
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    let winningRows:[[Int]] = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
    let gameScoreLabel = UILabel(frame: CGRect(x: 0, y: 700, width: 200, height: 50))
    
    let screenHeight = Int(UIScreen.mainScreen().bounds.height)
    let screenWidth = Int(UIScreen.mainScreen().bounds.width)
    
    var scoreView: UIView!
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //Create topView
        scoreView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 70))
        scoreView.backgroundColor = UIColor.cyanColor()
        view.addSubview(scoreView)
        
        let current = isPlayer1Turn ? "Player 1 Turn" : "Player 2 Turn"
        
       
        let atrString = NSMutableAttributedString(string: current, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 30.0)!])
        
      
        
        //Status Label
        gameStatusLabel.attributedText = atrString
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center = scoreView.center
        gameStatusLabel.textColor = UIColor.whiteColor()
        
        

        
        scoreView.addSubview(gameStatusLabel)
        
        //score Label
        gameScoreLabel.text = "P1 Score: \(p1Score) // P2 Score: \(p2Score)"
        gameScoreLabel.textAlignment = .Center
        gameScoreLabel.center.x = view.center.x
        view.addSubview(gameScoreLabel)
 

        //Draw Squares
        drawSquares()
        
        //Reset Button
        let resetButton = TTTButton(frame: CGRect(x: 20 , y: 20, width: 20, height: 20))
        resetButton.backgroundColor = UIColor.blackColor()
        resetButton.layer.cornerRadius = 50
        view.addSubview(resetButton)

     
     
    }


    func FieldFull() ->Bool {
       
        return grid.flatMap { $0 }
                   .filter { (s) -> Bool in
                return s == 0 }
                    .count == 0
        
        
    }
    
    func drawSquares() {
        
        let buttonHW = 100
        let buttonSpacing = 8
        
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
                button.layer.cornerRadius = 50
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                button.tag = 1
                view.addSubview(button)
                
            }
        }
    }
    
    
    
        func spacePressed(button: TTTButton) {
            
            let current = isPlayer1Turn ? "Player 1 Turn" : "Player 2 Turn"
            
            
            let atrString = NSMutableAttributedString(string: current, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 30.0)!])
            
               
                if button.playerNum == 0 {
                    
                    button.playerNum =  isPlayer1Turn ? 1 : 2
                    
                    grid[button.row][button.col] = isPlayer1Turn ? 1:2
                    
                    isPlayer1Turn = !isPlayer1Turn
                    
                    if isPlayer1Turn {
                        
                        gameStatusLabel.attributedText = atrString
                        button.setImage(UIImage(assetIdentifier: .Jo), forState: .Normal)
                        
                    } else if !isPlayer1Turn {
                        
                        gameStatusLabel.attributedText = atrString
                        button.setImage(UIImage(assetIdentifier: .Swifty), forState: .Normal)
                        
                    }
                    
                    checkForWinner()
                }
    }
    
        func checkForWinner() {
                
                
            
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
                            
                            if value1 == 1 {
                                winner = 1
                                p1Score++
                                
                            } else if value1 == 2 {
                                winner = 2
                                p2Score++
                            }
                            
                            if winner != nil {
                                alert(.Winner)
                                
                            }
                          
                        }
                    } else if FieldFull() {
                        alert(.Tie)
                        
                    }
                }
    }
    enum alertType: String {
        case Winner, Tie
    
    }
    
    func alert(type: alertType) {

        var message = ""
        switch type {
        case .Winner: message = "The Winner is player \(winner)"
        case .Tie: message = "We have a tie"
            
        }
        
        let ac = UIAlertController(title: type.rawValue, message: message, preferredStyle: .Alert)
        
        
        ac.addAction(UIAlertAction(title: "Restart", style: .Default, handler: { (alert) -> Void in
            
            self.restartGame()
            
        }))
        
        presentViewController(ac, animated: true, completion: nil)
        

        
    }

    
    
    func restartGame(){
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
       
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        
        for v in view.subviews {
            if v.tag == 1 {
                v.removeFromSuperview()
            }
        
        }
        drawSquares()
        isPlayer1Turn = true
        
    }
    
    func reset() {
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        drawSquares()
        isPlayer1Turn = true
        p1Score = 0
        p2Score = 0
        
    }
}


class TTTButton: UIButton {
    
    var row = 0
    var col = 0
    
    
    var playerNum = 0 {
        
        didSet {
            
            switch playerNum {
                
            case 1: self.setImage(UIImage(assetIdentifier: .Jo), forState: .Normal)
            case 2: self.setImage(UIImage(assetIdentifier: .Swifty), forState: .Normal)
            default: break
                
            }
        }
    }
}

extension UIImage {
    
    enum AssetIdentifier: String {
        
        case Swifty, Jo
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
       
        self.init(named: assetIdentifier.rawValue)

    }
}
