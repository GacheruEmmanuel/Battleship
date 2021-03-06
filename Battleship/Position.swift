//
//  Position.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/7/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import Foundation

struct Position
{
    var hasShip : Bool!
    var ship_been_hit: Bool!
    
    
    init(hasShip : Bool)
    {
        self.hasShip = hasShip;
        self.ship_been_hit = false;
    }
    
    mutating func destroy()
    {
        self.ship_been_hit = true;
    }
}
