//
//  Grid.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/11/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import Foundation
import UIKit

class Grid
{
    //4 Vars that keep track of ship placement
    let numShipSpaces : [Int] = [5,4,3,3,2]
    var numTilesPlacedOnShip : Int = 0
    var whichShipOn : Int = 0
    var directionOfShip : String = ""
    
    
    var spaces = [Position]()
    
    init(posArr : [Position])
    {
        spaces = posArr
    }
    
    func addShip(x: Int, y : Int)
    {
        spaces[x+y].hasShip = true;
    }
    
    func destroyPosition(x: Int, y: Int)
    {
        spaces[x+y].destroy()
    }
    
    func getPosition(x: Int, y : Int) -> Position
    {
        return spaces[x+y];
    }
    
    func placeShip (boardGridButtons : [UIButton]!, index : Int) {
        //If no tiles have been placed, put it anywhere
        //If one tile has been placed, set the direction after the second placement
        //If two or more tiles have been placed, make sure that the tiles are connected and in the right direction
        if numTilesPlacedOnShip == 0 {
            boardGridButtons[index].backgroundColor = .brown
            numTilesPlacedOnShip += 1
        } else if numTilesPlacedOnShip == 1{
            if boardGridButtons[index+1].backgroundColor == .brown || boardGridButtons[index-1].backgroundColor == .brown{
                boardGridButtons[index].backgroundColor = .brown
                directionOfShip = "Vertical"
                numTilesPlacedOnShip += 1
            } else if boardGridButtons[index+10].backgroundColor == .brown || boardGridButtons[index-10].backgroundColor == .brown {
                boardGridButtons[index].backgroundColor = .brown
                directionOfShip = "Horizontal"
                numTilesPlacedOnShip += 1
            }
            if numTilesPlacedOnShip == numShipSpaces[whichShipOn] {
                whichShipOn += 1
                numTilesPlacedOnShip = 0
                directionOfShip = ""
            }
            print(directionOfShip)
        } else {
            if boardGridButtons[index+1].backgroundColor == .brown || boardGridButtons[index-1].backgroundColor == .brown && directionOfShip == "Vertical"{
                boardGridButtons[index].backgroundColor = .brown
                numTilesPlacedOnShip += 1
            } else if boardGridButtons[index+10].backgroundColor == .brown || boardGridButtons[index-10].backgroundColor == .brown && directionOfShip == "Horizontal"{
                boardGridButtons[index].backgroundColor = .brown
                numTilesPlacedOnShip += 1
            }
            if numTilesPlacedOnShip == numShipSpaces[whichShipOn] {
                whichShipOn += 1
                numTilesPlacedOnShip = 0
                directionOfShip = ""
            }
        }
    }
    
    
}
