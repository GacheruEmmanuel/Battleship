//
//  ViewController.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/7/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    

    @IBOutlet var boardGridButtons: [UIButton]!
    var gridArr : [Position]! = [Position]()
    var grid : Grid!
    
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
        grid.placeShip(boardGridButtons: boardGridButtons, index: index)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for _ in boardGridButtons {
            let tempPosition : Position = Position(hasShip: false)
            gridArr.append(tempPosition)
        }
        grid = Grid(posArr: gridArr)
        
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

