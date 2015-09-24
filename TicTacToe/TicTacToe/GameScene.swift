//
//  GameScene.swift
//  TicTacToe
//
//  Created by Mac Bellingrath on 9/24/15.
//  Copyright (c) 2015 Mac Bellingrath. All rights reserved.
//


import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    var strategist: GKMinmaxStrategist!
    var gameModel : MyGameModel!
    var playerX : MyGameModelPlayer!
    var playerO : MyGameModelPlayer!
    var moveCount : Int = 0
  
    override func didMoveToView(view: SKView) {
        // Create and setup the players
        playerX = MyGameModelPlayer(playerID: 1,name: "player1")
        playerO = MyGameModelPlayer(playerID: 2, name:"player2")
        playerX.name = "X"
        playerO.name = "O"
        
        // Create and setup the game model
        gameModel = MyGameModel(width: 3, height: 3, players: [playerX, playerO])
        
        // Create and setup the strategist
        strategist = GKMinmaxStrategist()
        strategist.gameModel = gameModel
        strategist.maxLookAheadDepth = 1
        strategist.randomSource = nil
        
        // Commence game ...
        switchActivePlayer()
    
    }
    
    func switchActivePlayer() {
        if gameModel.activePlayer == nil || gameModel.activePlayer!.playerId == 2 {
            gameModel.activePlayer = playerX
        } else {
            gameModel.activePlayer = playerO
        }
        
        if moveCount == 9 {
            declareWinner(nil)
        } else {
            moveCount++
            performAIPlayerMove()
        }
    }
    
    
    func performAIPlayerMove() {
        let activePlayer = gameModel.activePlayer as! MyGameModelPlayer
        let move = strategist.bestMoveForPlayer(activePlayer) as? TheGameModelUpdate
        
        if move != nil 
            setBoardPieceForPlayer(activePlayer, move: move!)
            
            if gameModel.isWinForPlayer(activePlayer.playerId) == .WinThisMove {
                declareWinner(activePlayer)
            } else {
                switchActivePlayer()
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
