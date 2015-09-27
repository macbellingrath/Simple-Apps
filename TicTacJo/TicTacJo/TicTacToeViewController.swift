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
    var isFirstGame = true
    var inTheMiddleOfAGame = false {
        didSet{
            
            inTheMiddleOfAGame ? (playButton.hidden = true) : (playButton.hidden = false)

        }
    }
    var isPlayer1Turn = true  {
        didSet {
            topView.backgroundColor = isPlayer1Turn ? UIColor.orangeColor() : UIColor.purpleColor()
            gameStatusLabel.attributedText = makeAtrString(current)
        }
    }
    var p1Score = 0 {
        didSet {
          drawScoreButtons()
        }
    }
    var p2Score = 0 {
        didSet {
            drawScoreButtons()
        }
    }
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    let winningRows:[[Int]] = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    let midX = UIScreen.mainScreen().bounds.midX
    let midY = UIScreen.mainScreen().bounds.midY

    
    var topView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 70))
    
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
    let gameScoreLabel = UILabel(frame: CGRect(x: 0, y: 700, width: 200, height: 50))
    
    var p1ScoreLabel = TTTButton(frame: CGRect(x: 0, y: 100, width: 70, height: 70))
    var p2ScoreLabel = TTTButton(frame: CGRect(x: 0, y: 100, width: 70, height: 70))
    
    var playButton: TTTButton = TTTButton(frame: CGRect(x:  10 , y: 100, width: 20, height: 20))
    var resetButton = TTTButton(frame: CGRect(x: 280, y: 120, width: 50, height: 50))
 
    
    var current: String {
        get {
            
            return isPlayer1Turn ? "Player 1 Turn" : "Player 2 Turn"
        }
        
    }
    

    
    let screenHeight = Int(UIScreen.mainScreen().bounds.height)
    let screenWidth = Int(UIScreen.mainScreen().bounds.width)
    
    
    
    
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = UIColor.blackColor()
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(inTheMiddleOfAGame == false)
        
        if isFirstGame{
            gameStatusLabel.text = "Let's Play"
        }
        
        drawScoreButtons()
        
        
    
        
    
        //TopView
        topView.backgroundColor = UIColor.orangeColor()
        view.addSubview(topView)
       
        
        
        
      
        
        //Status Label
        gameStatusLabel.attributedText = makeAtrString(current)
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center = topView.center
        gameStatusLabel.textColor = UIColor.whiteColor()
        
        topView.addSubview(gameStatusLabel)
        
        //Score Labels
        gameScoreLabel.text = "P1 Score: \(p1Score) // P2 Score: \(p2Score)"
        gameScoreLabel.textAlignment = .Center
        gameScoreLabel.center.x = view.center.x
        view.addSubview(gameScoreLabel)
 

        //Draw Gameboard buttons
        drawButtons()
        
        
       
        

        
       
     
     
        
    }
    
    func drawScoreButtons() {
        p1ScoreLabel.center = CGPoint(x: midX - 100, y: 130)
        p1ScoreLabel.layer.borderWidth  = 3
        p1ScoreLabel.layer.borderColor = UIColor.orangeColor().CGColor
        p1ScoreLabel.setTitle("\(p1Score)", forState: .Normal )
        p1ScoreLabel.backgroundColor  = UIColor.clearColor()
        p1ScoreLabel.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        p1ScoreLabel.layer.cornerRadius = p1ScoreLabel.frame.height / 2
        view.addSubview(p1ScoreLabel)
        
        p2ScoreLabel.center = CGPoint(x: midX, y: 130)
        p2ScoreLabel.layer.borderWidth  = 3
        p2ScoreLabel.layer.borderColor = UIColor.purpleColor().CGColor
        p2ScoreLabel.setTitle("\(p2Score)", forState: .Normal )
        p2ScoreLabel.backgroundColor  = UIColor.clearColor()
        p2ScoreLabel.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        p2ScoreLabel.layer.cornerRadius = p2ScoreLabel.frame.height / 2
        view.addSubview(p2ScoreLabel)
       
        
    }
    
    func playButtonPressed() {
        startGame()
        print("playbuttonpressed")
    }

    func startGame() {
        isPlayer1Turn = true
        playButton.hidden = true
        inTheMiddleOfAGame = true
        
    }

    //Determine a Tie
    func FieldFull() ->Bool {
       
        return grid.flatMap { $0 }
                   .filter { (s) -> Bool in
                return s == 0 }
                    .count == 0
        
        
    }
    
    func drawButtons() {
        
        let buttonHW = 100
        let buttonSpacing = 8
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW)/2
        let topSpacing = (screenHeight - gridHW)/2
        
        
       
        
        for (r,row) in grid.enumerate() {
            
            for (c,_) in row.enumerate() {
                
                let x = r * (buttonHW + buttonSpacing) + leftSpacing
                let y = c * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: 100, height: 100))
                button.backgroundColor = UIColor.clearColor()
                button.layer.borderColor = UIColor.whiteColor().CGColor
                button.layer.borderWidth = 2
                button.layer.cornerRadius = 50
                
                button.row = r
                button.col = c
                
                button.tag = 1
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)

                view.addSubview(button)
                
            }
        }
        
        //Reset Button
        resetButton = TTTButton(frame: CGRect(x: 300, y: 13, width: 50, height: 50))
        resetButton.center = CGPoint(x: 310, y: 130)
        resetButton.setTitle("X", forState: .Normal)
        resetButton.addTarget(self, action: "reset", forControlEvents: .TouchUpInside)
        resetButton.backgroundColor = UIColor.redColor()
        resetButton.titleLabel?.textColor = UIColor.whiteColor()
        resetButton.layer.cornerRadius = resetButton.frame.width / 2
        view.addSubview(resetButton)
        
        if inTheMiddleOfAGame == false {
            //Play Button
            playButton = TTTButton(frame: CGRect(x: 0, y: 600, width: 90, height: 90))
            playButton.center = CGPoint(x: midX, y: 630)
            playButton.layer.cornerRadius = playButton.frame.width / 2
            playButton.setTitle("Play", forState: .Normal)
            playButton.addTarget(self, action: "playButtonPressed", forControlEvents: .TouchUpInside)
            playButton.backgroundColor = UIColor.clearColor()
            playButton.layer.borderWidth = 3
            playButton.layer.borderColor = UIColor.whiteColor().CGColor
            playButton.titleLabel?.textColor = UIColor.whiteColor()
            view.addSubview(playButton)
            
        }
        

        
    }
    func makeAtrString(string: String) -> NSMutableAttributedString {
        let atrString = NSMutableAttributedString(string: string, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 30.0)!])
        
        return atrString
    }
    
    
    //Called when a player presses one of the spaces on the board
        func spacePressed(button: TTTButton) {
            

            inTheMiddleOfAGame = true
            
            
                if button.playerNum == 0 {
                    
                    button.playerNum =  isPlayer1Turn ? 1 : 2
                    
                    grid[button.row][button.col] = isPlayer1Turn ? 1:2
                    
                    isPlayer1Turn = !isPlayer1Turn
                    
                   
                    
                    
                    if isPlayer1Turn {
                        
                        gameStatusLabel.attributedText = makeAtrString(current)
                        
                        button.setImage(UIImage(assetIdentifier: .Jo), forState: .Normal)
                    
                        
                    } else if !isPlayer1Turn {
                        
                        gameStatusLabel.attributedText = makeAtrString(current)
                        button.setImage(UIImage(assetIdentifier: .Swifty), forState: .Normal)
                        
                    }
                    
                    checkForWinner()
                }
    }
    
    //A check to see if the current game has a winner. This is called every time that an empty space on the board is filled by a player.
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
                    
                    if value1 == value2 && value2 == value3  && FieldFull() == false {
                       
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
        
        
        ac.addAction(UIAlertAction(title: "Play Again", style: .Default, handler: { (alert) -> Void in
            
            self.restartGame()
            
            
        }))
        
        presentViewController(ac, animated: true, completion: nil)
        

        
    }

  
    func restartGame(){
        
        
       
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        
        for v in view.subviews {
            if v.tag == 1 {
                v.removeFromSuperview()
            }
        
        }
        drawButtons()
        isPlayer1Turn = true
        inTheMiddleOfAGame = false
        
        
        
    }
    
    func reset() {
        isFirstGame = true
        restartGame()
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        p1Score = 0
        p2Score = 0
        playButton.hidden = false
        inTheMiddleOfAGame = false
        
    }
}

