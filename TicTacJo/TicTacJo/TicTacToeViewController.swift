//
//  TicTacToeViewController.swift
//  TicTacJo
//
//  Created by Mac Bellingrath on 9/25/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
   
    var winner: Int! {
        didSet {
            playButton.setAttributedTitle(makeAtrString("Play"), forState: .Normal)
            playButton.titleLabel?.textColor = UIColor.blackColor()
        }
    }
    
    var tie: Bool  {
        get {
            return FieldFull()
        }
    }
    var isFirstGame = true
    var inTheMiddleOfAGame = false {
        didSet{
            
            inTheMiddleOfAGame ? playButton.setAttributedTitle(makeAtrString("End"), forState: .Normal) :  (playButton.setAttributedTitle(makeAtrString("Play"), forState: .Normal))

        }
    }
    var isPlayer1Turn = false  {
        didSet {
            topView.backgroundColor = isPlayer1Turn ? UIColor.darkGrayColor() : UIColor.lightGrayColor()
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
        view.backgroundColor = UIColor.whiteColor()
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(inTheMiddleOfAGame == false)
        
        if isFirstGame{
            gameStatusLabel.text = "Let's Play"
        }
        
        drawScoreButtons()
       
    
        //TopView
        topView.backgroundColor = UIColor.darkGrayColor()
        view.addSubview(topView)
     
        //Status Label
        gameStatusLabel.attributedText = makeAtrString(current)
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center = topView.center
        gameStatusLabel.textColor = UIColor.whiteColor()
        
        topView.addSubview(gameStatusLabel)
        
         

        //Draw Gameboard buttons
        drawButtons()
       
    }
    
    func drawScoreButtons() {
        p1ScoreLabel.center = CGPoint(x: midX - 100, y: 130)
        p1ScoreLabel.layer.borderWidth  = 3
        p1ScoreLabel.layer.borderColor = UIColor.darkGrayColor().CGColor
        p1ScoreLabel.setAttributedTitle(makeAtrString("\(p1Score)"), forState: .Normal)
        p1ScoreLabel.backgroundColor  = UIColor.clearColor()
        p1ScoreLabel.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        p1ScoreLabel.layer.cornerRadius = p1ScoreLabel.frame.height / 2
        view.addSubview(p1ScoreLabel)
        
        p2ScoreLabel.center = CGPoint(x: midX, y: 130)
        p2ScoreLabel.layer.borderWidth  = 3
        p2ScoreLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        p2ScoreLabel.setAttributedTitle(makeAtrString("\(p2Score)"), forState: .Normal)
        p2ScoreLabel.backgroundColor  = UIColor.clearColor()
        p2ScoreLabel.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        p2ScoreLabel.layer.cornerRadius = p2ScoreLabel.frame.height / 2
        view.addSubview(p2ScoreLabel)
       
        
    }
    
    func playButtonPressed() {
        playButton.setTitle("End", forState: .Normal)
        isPlayer1Turn = true
        
        inTheMiddleOfAGame = true
        if inTheMiddleOfAGame {
            restartGame()
        } else {
            reset()
        }
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
                button.layer.borderColor = UIColor.blackColor().CGColor
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
        resetButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        resetButton.setAttributedTitle(makeAtrString("X"), forState: .Normal)
        
        resetButton.addTarget(self, action: "reset", forControlEvents: .TouchUpInside)
        resetButton.backgroundColor = UIColor.clearColor()
        resetButton.layer.borderColor = UIColor.redColor().CGColor
        resetButton.layer.borderWidth = 3
        
        resetButton.layer.cornerRadius = resetButton.frame.width / 2
        view.addSubview(resetButton)
        
        
            //Play Button
            playButton = TTTButton(frame: CGRect(x: 0, y: 600, width: 90, height: 90))
            playButton.center = CGPoint(x: midX, y: 630)
            playButton.layer.cornerRadius = playButton.frame.width / 2
            playButton.setTitle("Play", forState: .Normal)
            playButton.addTarget(self, action: "playButtonPressed", forControlEvents: .TouchUpInside)
            playButton.backgroundColor = UIColor.clearColor()
            playButton.layer.borderWidth = 3
            playButton.layer.borderColor = UIColor.blackColor().CGColor
            playButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
       
            view.addSubview(playButton)
            
        
        

        
    }
    
    
    //Called when a player presses one of the spaces on the board
        func spacePressed(button: TTTButton) {
          
            if FieldFull() {
                return
            }
            
            if winner != nil {
                return
            }

            if inTheMiddleOfAGame == true {
            
            
                if button.playerNum == 0 {
                    
                    button.playerNum =  isPlayer1Turn ? 1 : 2
                    
                    grid[button.row][button.col] = isPlayer1Turn ? 1:2
                    
                    
                   
                    
                    
                    if isPlayer1Turn {
                        
                        gameStatusLabel.attributedText = makeAtrString(current)
                        
                        button.putSymbol("X")
                        
                    
                        
                    } else if !isPlayer1Turn {
                        
                        gameStatusLabel.attributedText = makeAtrString(current)
                        button.putSymbol("O")
                        
                    }
                    isPlayer1Turn = !isPlayer1Turn
                    
                    checkForWinner()
                }
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
                                gameStatusLabel.attributedText = makeAtrString("Winner: \(winner)")
                                
                            }
                          
                        }
                    } else if tie {
                        gameStatusLabel.text = "Tie"
                        playButton.setAttributedTitle(makeAtrString("Play"), forState: .Normal)
                    }
                }

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
        winner = nil
        
        
        
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

extension TicTacToeViewController {
    class func makeAtrString(string: String) -> NSMutableAttributedString {
        let atrString = NSMutableAttributedString(string: string, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 30.0)!])
        
        return atrString
    }

}
extension TTTButton {
    static func makeAtrString(string: String) -> NSMutableAttributedString {
        let atrString = NSMutableAttributedString(string: string, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 30.0)!])
        
        return atrString
    }

}

