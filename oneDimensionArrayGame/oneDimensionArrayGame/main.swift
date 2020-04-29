//
//  main.swift
//  oneDimensionArrayGame
//
//  Created by José Antônio Maria de Rezende Silva on 4/29/20.
//  Copyright © 2020 José Antônio Maria de Rezende Silva. All rights reserved.
//

import Foundation

var position = 0
var userWon = false
var count = 0

func playGame () {
    var amountOfElements: Int = Int(readLine()!)!
    let leap: Int = Int(readLine()!)!
    let gameArrayReadLine: String = readLine()!
    let gameArrayString = gameArrayReadLine.components(separatedBy: " ")
    let gameArray = gameArrayString.map { Int($0)!}
    amountOfElements -= 1
    
    repeat {
        if gameArray.first! == 0 {
            if position < amountOfElements {
                if gameArray[position + 1] == 0 {
                    position += 1
                }
                else {
                    if gameArray[position + leap] == 0 || (position + leap) >= amountOfElements {
                        position += leap
                    }
                    else {
                        if (position - 1) > 0 {
                            if gameArray[position - 1 ] == 0 {
                                position -= 1
                            }
                        }
                    }
                }
            }
        }
        userWon = false
        if (position + leap) >= amountOfElements {
            userWon = true
        }
        
        count += 1
        //print("\(position) \(userWon) \(count)")
    } while userWon == true && count >= 100
    print("\(userWon)")
}

var numberGames = Int(readLine()!)!
var inputCount = 0

while inputCount != numberGames {
    inputCount += 1
    playGame()
}
