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
    //5 Vars that keep track of ship placement
    let numShipSpaces : [Int] = [5,4,3,3,2]
    var numTilesPlacedOnShip : Int = 0
    var whichShipOn : Int = 0
    var directionOfShip : String = ""
    var currentShipPieces : [Position] = [Position]()
    
    
    var ships : [Ship] = [Ship]()
    
    var spaces = [Position]()
    
    init(posArr : [Position])
    {
        spaces = posArr
    }
    
    func addShip(index : Int)
    {
        spaces[index].hasShip = true;
    }
    
    func destroyPosition(index : Int)
    {
        spaces[index].destroy()
    }
    
    func getPosition(index : Int) -> Position
    {
        return spaces[index];
    }
    
    func placeShip (boardGridButtons : [UIButton]!, index : Int) {
        //If no tiles have been placed, put it anywhere
        //If one tile has been placed, set the direction after the second placement
        //If two or more tiles have been placed, make sure that the tiles are connected and in the right direction
        
        if numTilesPlacedOnShip == 0 && whichShipOn < numShipSpaces.count{
            boardGridButtons[index].backgroundColor = .brown
            numTilesPlacedOnShip += 1
            addShip(index: index)
            currentShipPieces.append(getPosition(index: index))
            
        } else if numTilesPlacedOnShip == 1 && whichShipOn < numShipSpaces.count{
            
            if boardGridButtons[index+1].backgroundColor == .brown || boardGridButtons[index-1].backgroundColor == .brown{
                boardGridButtons[index].backgroundColor = .brown
                directionOfShip = "Vertical"
                numTilesPlacedOnShip += 1
                addShip(index: index)
                currentShipPieces.append(getPosition(index: index))
                
            } else if boardGridButtons[index+10].backgroundColor == .brown || boardGridButtons[index-10].backgroundColor == .brown {
                
                boardGridButtons[index].backgroundColor = .brown
                directionOfShip = "Horizontal"
                numTilesPlacedOnShip += 1
                addShip(index: index)
                currentShipPieces.append(getPosition(index: index))
                
            }
            print(directionOfShip)
            
        } else if whichShipOn < numShipSpaces.count {
            if boardGridButtons[index+1].backgroundColor == .brown || boardGridButtons[index-1].backgroundColor == .brown && directionOfShip == "Vertical"{
                
                boardGridButtons[index].backgroundColor = .brown
                numTilesPlacedOnShip += 1
                addShip(index: index)
                currentShipPieces.append(getPosition(index: index))
                
            } else if boardGridButtons[index+10].backgroundColor == .brown || boardGridButtons[index-10].backgroundColor == .brown && directionOfShip == "Horizontal"{
                
                boardGridButtons[index].backgroundColor = .brown
                numTilesPlacedOnShip += 1
                addShip(index: index)
                currentShipPieces.append(getPosition(index: index))
                
            }
        }
        if whichShipOn < numShipSpaces.count && numTilesPlacedOnShip == numShipSpaces[whichShipOn] {
            
            ships.append(Ship(size: numShipSpaces[whichShipOn], positions: currentShipPieces))
            currentShipPieces = []
            print(ships)
            whichShipOn += 1
            numTilesPlacedOnShip = 0
            directionOfShip = ""
            
        }
    }
    
    
}
