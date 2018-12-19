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
    
    @IBAction func changeNames(_ sender: UIButton) {
        //sender.setTitle("ship", for: .normal)
        
        //Identifying the index of the tile pressed
        var index = 0
        while index < boardGridButtons.count {
            if boardGridButtons[index] == sender {
                break
            }
            index += 1
        }
        
        
        //Changing the color of the tile that was hit
        boardGridButtons[index+1].backgroundColor = .brown
        boardGridButtons[index-1].backgroundColor = .brown
        boardGridButtons[index+10].backgroundColor = .brown
        boardGridButtons[index-10].backgroundColor = .brown
        
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
            button.addTarget(self, action: #selector(changeNames(_:)), for: .touchUpInside)
            button.setTitle("", for: .normal)
            button.backgroundColor = .blue
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

 
    
    

}

