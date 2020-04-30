//
//  main.swift
//  oneDimensionArrayGame
//
//  Created by José Antônio Maria de Rezende Silva on 4/29/20.
//  Copyright © 2020 José Antônio Maria de Rezende Silva. All rights reserved.
//

import Foundation

func playGame () -> [String] {
    var position = 0
    var userWon = ["NO"]
    var count = 0
    
    let valuesArrayReadLine: String = readLine()!
    let valuesArrayString = valuesArrayReadLine.components(separatedBy: " ")
    var valuesArray = valuesArrayString.map { Int($0)!}
    
    var numbersOfGames = valuesArray[0]
    var valueOfLeap = valuesArray[1]
    
    let gameArrayReadLine: String = readLine()!
    let gameArrayString = gameArrayReadLine.components(separatedBy: " ")
    let gameArray = gameArrayString.map { Int($0)!}
    numbersOfGames -= 1
    
    repeat {
        if gameArray.first! == 0 {
            if position < numbersOfGames {
                if gameArray[position + 1] == 0 {
                    position += 1
                }
                else {
                    if gameArray[position + valueOfLeap] == 0 || (position + valueOfLeap) >= numbersOfGames {
                        position += valueOfLeap
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
        
        userWon = ["NO"]
        
        if (position + valueOfLeap) >= numbersOfGames {
            userWon = ["YES"]
        }
        
        count += 1
        //print("\(position) \(userWon) \(count)")
    } while userWon != ["YES"] && count >= 128
    //print("\(userWon)")
    
    return userWon
}

var numberGames = Int(readLine()!)!
var inputCount = 0
var resultsOfGame: [String] = []


while inputCount != numberGames {
    inputCount += 1
    let result: [String] = playGame()
    resultsOfGame.append(contentsOf: result)
}

var resultCount = 0
//inputCount -= 1
//print(resultsOfGame)
repeat {
    print(resultsOfGame[resultCount])
    resultCount += 1
}while resultCount != inputCount
