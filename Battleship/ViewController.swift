//
//  ViewController.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/7/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //2 Vars that keep track of ship placement
    let numShipSpaces : [Int] = [5,4,3,3,2]
    var numTilesPlacedOnShip : Int = 0
    var whichShipOn : Int = 0
    var directionOfShip : String = ""

    @IBOutlet var boardGridButtons: [UIButton]!
    var gridArr : [Position]! = [Position]()
    
    @IBAction func placeShip(_ sender: UIButton) {
        //sender.setTitle("ship", for: .normal)
        
        //Identifying the index of the tile pressed
        var index = 0
        while index < boardGridButtons.count {
            if boardGridButtons[index] == sender {
                break
            }
            index += 1
        }
        
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
            
            print(directionOfShip)
        } else {
            print("Error")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for _ in boardGridButtons {
            let tempPosition : Position = Position(hasShip: false)
            gridArr.append(tempPosition)
        }
        
        //For every button on the screen
        for button in boardGridButtons {
            button.addTarget(self, action: #selector(placeShip(_:)), for: .touchUpInside)
            button.setTitle("", for: .normal)
            button.backgroundColor = .blue
        }
        //placeShips()
        
    }
    
    //the Loop for placing Ships
    //Start with the 5 and place in decending order
    /*func placeShips () {
        
    }*/

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

 
    
    

}

