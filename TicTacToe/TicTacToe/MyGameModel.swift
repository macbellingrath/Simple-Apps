//
//  MyGameModel.swift
//  TicTacToe
//
//  Created by Mac Bellingrath on 9/24/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import GameKit

class MyGameModel: NSObject, NSCopying, GKGameModel {
   
    var board : Array<Int>
    var boardWidth : Int
    var boardHeight : Int
    
    required init(width: Int, height: Int, players: [GKGameModelPlayer]) {
        boardWidth = width;
        boardHeight = height;
        board = Array<Int>(count: width * height, repeatedValue: 0);
        _players = players
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject { // NSCopying protocol function
        let copy = self.dynamicType.init(width: boardWidth, height: boardHeight, players: players!)
        copy.setGameModel(self)
        return copy
    }
    
    func setGameModel(gameModel: GKGameModel) {
        let inputModel = gameModel as! MyGameModel
        self.board = inputModel.board
        self.activePlayer = inputModel.activePlayer
    }


}
