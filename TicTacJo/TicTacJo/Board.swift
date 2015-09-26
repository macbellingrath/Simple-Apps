//
//  Board.swift
//  TicTacJo
//
//  Created by Mac Bellingrath on 9/25/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import Foundation


class Board {
    
    let X = "X"
    let O = "O"
    let emptySymbol = ""
    let tie = "T"
    
    let boardSize = 9
    
    var boardArray:[String] = []
    let winningRows:[[Int]] = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    
    init() {
        for _ in 0..<boardSize {
            self.boardArray.append(emptySymbol)
        }
    }
    
    
    func reset(){
        for i in 0..<boardSize {
            self.boardArray[i] = emptySymbol
            
        }
    }
    
    func getValAt(location: Int) -> String? {
        
        if location >= 0 && location <= self.boardSize {
            return self.boardArray[location]
        } else {
            return nil
        }
        
        
    }
    
    func put(symbol: String, atIndex: Int) -> String? {
        
        if atIndex >= 0 && atIndex <= self.boardSize && (symbol == X || symbol == O) {
            
            self.boardArray[atIndex] = symbol
            return winner()
        } else {
            return nil
        }
        
    }
    
    func winner() -> String? {
        
        for row in 0..<winningRows.count {
            if self.boardArray[winningRows[row][0]] != emptySymbol && self.boardArray[winningRows[row][0]] == self.boardArray[winningRows[row][1]] && self.boardArray[winningRows[row][1]] == self.boardArray[winningRows[row][2]] {
                return self.boardArray[winningRows[row][0]]
            }
        
        }
        for i in 0..<self.boardArray.count {
            if self.boardArray[i] == emptySymbol {
                return nil
            
            }
        }
        return tie
    }
    
    func getWinningCellIndexes() -> [Int]? {
        
        for row in 0..<winningRows.count {
            if self.boardArray[winningRows[row][0]] != emptySymbol && self.boardArray[winningRows[row][0]] == self.boardArray[winningRows[row][1]] && self.boardArray[winningRows[row][1]] == self.boardArray[winningRows[row][2]]
            {
                return [winningRows[row][0], winningRows[row][1], winningRows[row][2]]
            }
        }
        return nil
    }
    
    
}