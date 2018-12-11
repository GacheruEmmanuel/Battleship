//
//  Grid.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/11/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import Foundation

class Grid
{
    var spaces = [Position]()
    
    init(size : Int)
    {
        for _ in 0...size
        {
            let position = Position(hasShip: false)
            spaces.append(position)
        }
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
    
    
}
