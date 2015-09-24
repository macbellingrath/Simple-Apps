//
//  MyGameModelPlayer.swift
//  TicTacToe
//
//  Created by Mac Bellingrath on 9/24/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import GameKit

class MyGameModelPlayer: NSObject, GKGameModelPlayer{
    
    var playerId: Int
    var name: String
    
    init(playerID: Int, name: String) {
        self.playerId = playerID
        self.name = name
    }


}
